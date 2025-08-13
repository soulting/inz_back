import time
import jwt
import datetime
import os

import bcrypt
from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token

placement_test_bp = Blueprint('placement_test', __name__)

@placement_test_bp.route('/get_test', methods=['GET'])
def get_test():
    level = request.args.get('id')
    if not level:
        return jsonify({"error": "Missing level id"}), 400

    try:
        # Pobierz wszystkie zadania dla danego poziomu
        tasks_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("level", level) \
            .execute()


        tasks = tasks_response.data

        # Dla każdego zadania pobierz podpunkty
        for task in tasks:
            task_items_response = supabase \
                .from_("task_items") \
                .select("*") \
                .eq("task_id", task["id"]) \
                .execute()

            task["task_items"] = task_items_response.data if task_items_response.data else []

        return jsonify(tasks)


    except APIError as e:

        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:

        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@placement_test_bp.route('/submit_test', methods=['POST'])
def submit_test():
    auth_header = request.headers.get('Authorization')

    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.json

    answers_data = data.get("answers", {})
    answers = answers_data.get("answers", [])
    level = answers_data.get("level", "A1")

    print("Received data:", data)
    print("Answers length:", len(answers))
    print(f"Level: {level}")

    try:
        print(f"Sprawdzam i usuwam stare wyniki dla użytkownika {user_id} na poziomie {level}")

        tasks_response = supabase.table("tasks").select("id").eq("level", level).execute()
        task_ids = [task["id"] for task in (tasks_response.data or [])]

        deleted_count = 0
        if task_ids:
            print(f"Znaleziono {len(task_ids)} zadań dla poziomu {level}")

            existing_results = supabase.table("task_results") \
                .select("id") \
                .eq("user_id", user_id) \
                .in_("task_id", task_ids) \
                .execute()

            existing_count = len(existing_results.data) if existing_results.data else 0
            print(f"Znaleziono {existing_count} istniejących wyników do usunięcia")

            if existing_count > 0:
                delete_response = supabase.table("task_results") \
                    .delete() \
                    .eq("user_id", user_id) \
                    .in_("task_id", task_ids) \
                    .execute()

                deleted_count = existing_count
                print(f"Usunięto {deleted_count} starych wyników")

        print("Dodaję nowe wyniki...")
        task_result_ids = []

        for i, answer in enumerate(answers):
            task_result_insert = {
                "user_id": user_id,
                "task_id": answer["taskId"],
                "task_points": answer["taskPoints"],
                "task_error": answer["taskError"],
                "task_uncertainty": answer["taskUncertainty"],
                "difficulty": answer["difficulty"],
                "time_spent": answer["timeSpent"],
                "completion_date": answer["completionDate"]
            }

            result = supabase.table("task_results").insert(task_result_insert).execute()

            if not result.data:
                raise Exception(f"Failed to insert task result for answer {i + 1}")

            task_result_id = result.data[0]["id"]
            task_result_ids.append(task_result_id)

            task_items_result = answer.get("scoredAnswers", [])
            for sub in task_items_result:
                task_items_data = list(sub.values())[0]

                supabase.table("answer_items").insert({
                    "task_result_id": task_result_id,
                    "item_id": list(sub.keys())[0],
                    "point": task_items_data["point"],
                    "error": task_items_data["error"],
                    "uncertain": task_items_data["uncertain"],
                    "my_answer": task_items_data["myAnswer"],
                    "correct_answer": task_items_data["correctAnswer"]
                }).execute()

        print(f"Zapisano {len(task_result_ids)} nowych wyników")

        analysis = generate_quick_analysis(answers)

        response_message = f"Test na poziomie {level} został zapisany pomyślnie"
        if deleted_count > 0:
            response_message = f"Test na poziomie {level} został zaktualizowany (nadpisano {deleted_count} starych wyników)"

        return jsonify({
            "status": "success",
            "message": response_message,
            "analysis": analysis,
            "task_results_saved": len(task_result_ids),
            "old_results_replaced": deleted_count,
            "level": level
        }), 200

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500


def generate_quick_analysis(answers):
    if not answers:
        return {
            "overall_stats": {
                "total_tasks": 0,
                "total_points": 0,
                "total_errors": 0,
                "total_uncertainty": 0,
                "total_time": 0,
                "overall_score_percentage": 0
            },
            "best_subcategories": [],
            "worst_subcategories": [],
            "main_categories_summary": []
        }

    total_points = 0
    total_errors = 0
    total_uncertainty = 0
    total_time = 0
    total_tasks = len(answers)

    subcategory_stats = {}
    main_category_stats = {}

    for answer in answers:
        main_category = answer.get("main_category", "Nieznana kategoria")
        sub_category = answer.get("sub_category", "Nieznana podkategoria")

        subcategory_key = f"{main_category} → {sub_category}"

        points = answer.get("taskPoints", 0)
        errors = answer.get("taskError", 0)
        uncertainty = answer.get("taskUncertainty", 0)
        time_spent = answer.get("timeSpent", 0)

        total_points += points
        total_errors += errors
        total_uncertainty += uncertainty
        total_time += time_spent

        if subcategory_key not in subcategory_stats:
            subcategory_stats[subcategory_key] = {
                "main_category": main_category,
                "sub_category": sub_category,
                "full_name": subcategory_key,
                "total_points": 0,
                "total_errors": 0,
                "total_uncertainty": 0,
                "total_tasks": 0,
                "total_time": 0
            }

        subcategory_stats[subcategory_key]["total_points"] += points
        subcategory_stats[subcategory_key]["total_errors"] += errors
        subcategory_stats[subcategory_key]["total_uncertainty"] += uncertainty
        subcategory_stats[subcategory_key]["total_tasks"] += 1
        subcategory_stats[subcategory_key]["total_time"] += time_spent

        if main_category not in main_category_stats:
            main_category_stats[main_category] = {
                "category": main_category,
                "total_points": 0,
                "total_errors": 0,
                "total_uncertainty": 0,
                "total_tasks": 0,
                "total_time": 0,
                "subcategories": set()
            }

        main_category_stats[main_category]["total_points"] += points
        main_category_stats[main_category]["total_errors"] += errors
        main_category_stats[main_category]["total_uncertainty"] += uncertainty
        main_category_stats[main_category]["total_tasks"] += 1
        main_category_stats[main_category]["total_time"] += time_spent
        main_category_stats[main_category]["subcategories"].add(sub_category)

    subcategories_list = []
    for subcategory_key, stats in subcategory_stats.items():
        total_possible = stats["total_points"] + stats["total_errors"] + stats["total_uncertainty"]
        score_percentage = (stats["total_points"] / total_possible * 100) if total_possible > 0 else 0
        avg_time = stats["total_time"] / stats["total_tasks"] if stats["total_tasks"] > 0 else 0

        subcategories_list.append({
            "main_category": stats["main_category"],
            "sub_category": stats["sub_category"],
            "full_name": stats["full_name"],
            "total_points": stats["total_points"],
            "total_errors": stats["total_errors"],
            "total_uncertainty": stats["total_uncertainty"],
            "total_tasks": stats["total_tasks"],
            "total_time": stats["total_time"],
            "score_percentage": round(score_percentage, 1),
            "avg_time_per_task": round(avg_time, 1)
        })

    subcategories_list.sort(key=lambda x: (x["score_percentage"], -x["avg_time_per_task"]), reverse=True)

    best_subcategories = subcategories_list[:3]
    worst_subcategories = subcategories_list[-3:] if len(subcategories_list) > 3 else []
    if len(subcategories_list) <= 3:
        worst_subcategories = []

    main_categories_summary = []
    for main_category, stats in main_category_stats.items():
        total_possible = stats["total_points"] + stats["total_errors"] + stats["total_uncertainty"]
        score_percentage = (stats["total_points"] / total_possible * 100) if total_possible > 0 else 0
        avg_time = stats["total_time"] / stats["total_tasks"] if stats["total_tasks"] > 0 else 0

        main_categories_summary.append({
            "category": main_category,
            "total_points": stats["total_points"],
            "total_errors": stats["total_errors"],
            "total_uncertainty": stats["total_uncertainty"],
            "total_tasks": stats["total_tasks"],
            "total_time": stats["total_time"],
            "score_percentage": round(score_percentage, 1),
            "avg_time_per_task": round(avg_time, 1),
            "subcategories_count": len(stats["subcategories"]),
            "subcategories": list(stats["subcategories"])
        })

    main_categories_summary.sort(key=lambda x: (x["score_percentage"], -x["avg_time_per_task"]), reverse=True)

    total_possible = total_points + total_errors + total_uncertainty
    overall_score_percentage = (total_points / total_possible * 100) if total_possible > 0 else 0

    overall_stats = {
        "total_tasks": total_tasks,
        "total_points": total_points,
        "total_errors": total_errors,
        "total_uncertainty": total_uncertainty,
        "total_time": total_time,
        "overall_score_percentage": round(overall_score_percentage, 1),
        "avg_time_per_task": round(total_time / total_tasks, 1) if total_tasks > 0 else 0,
        "total_subcategories": len(subcategories_list),
        "total_main_categories": len(main_categories_summary)
    }

    recommendations = []
    if best_subcategories:
        best = best_subcategories[0]
        recommendations.append(f"💪 Najlepsza umiejętność: {best['sub_category']} ({best['score_percentage']}%)")

    if worst_subcategories:
        worst = worst_subcategories[0]
        recommendations.append(f"📚 Do poprawy: {worst['sub_category']} ({worst['score_percentage']}%)")

    if overall_score_percentage >= 80:
        recommendations.append("🏆 Świetny wynik! Doskonale opanowałeś materiał.")
    elif overall_score_percentage >= 60:
        recommendations.append("👍 Dobry wynik! Kilka obszarów do doszlifowania.")
    else:
        recommendations.append("📖 Warto poćwiczyć słabsze obszary.")

    return {
        "overall_stats": overall_stats,
        "best_subcategories": best_subcategories,
        "worst_subcategories": worst_subcategories,
        "main_categories_summary": main_categories_summary,
        "recommendations": recommendations
    }