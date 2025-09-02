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

@placement_test_bp.route('/get_test/<level>', methods=['GET'])
def get_test(level):
    if not level:
        return jsonify({"error": "Missing level id"}), 400

    try:
        tasks_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("level", level) \
            .eq("owner_id", "aa9792f9-6bc2-4078-aa1d-2364f68b41db")\
            .execute()


        tasks = tasks_response.data

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
    data = request.json or {}

    answers_data = data.get("answers", {})
    answers = answers_data.get("answers", [])
    level = answers_data.get("level", "A1")

    try:
        tasks_response = supabase.table("tasks").select("id").eq("level", level).execute()
        task_ids = [task["id"] for task in (tasks_response.data or [])]

        if task_ids:
            supabase.table("task_results") \
                .delete() \
                .eq("user_id", user_id) \
                .in_("task_id", task_ids) \
                .execute()

        for i, answer in enumerate(answers):
            result = supabase.table("task_results").insert({
                "user_id": user_id,
                "task_id": answer["taskId"],
                "task_points": answer["taskPoints"],
                "task_error": answer["taskError"],
                "task_uncertainty": answer["taskUncertainty"],
                "difficulty": answer["difficulty"],
                "time_spent": answer["timeSpent"],
                "completion_date": answer["completionDate"]
            }).execute()

            if not result.data:
                raise Exception(f"Failed to insert task result for answer {i + 1}")

            task_result_id = result.data[0]["id"]

            # Zapisz sub-odpowiedzi
            for sub in answer.get("scoredAnswers", []):
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

        analysis = generate_analysis(answers)

        return jsonify({
            "status": "success",
            "message": f"Test na poziomie {level} został zapisany pomyślnie",
            "analysis": analysis,
            "level": level
        }), 200

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"error": str(e)}), 500


def generate_analysis(answers):
    total_points = 0
    total_errors = 0
    total_uncertainty = 0
    total_time = 0
    total_tasks = len(answers)
    total_weighted_score = 0

    subcategory_stats = {}

    for answer in answers:
        main_category = answer.get("main_category")
        sub_category = answer.get("sub_category")

        subcategory_key = f"{main_category}:{sub_category}"

        points = answer.get("taskPoints", 0)
        errors = answer.get("taskError", 0)
        uncertainty = answer.get("taskUncertainty", 0)
        time_spent = answer.get("timeSpent", 0)

        # Oblicz ważoną punktację dla tego zadania
        weighted_score = (points * 1) + (errors * -0.5) + (uncertainty * -0.25)

        total_points += points
        total_errors += errors
        total_uncertainty += uncertainty
        total_time += time_spent
        total_weighted_score += weighted_score

        if subcategory_key not in subcategory_stats:
            subcategory_stats[subcategory_key] = {
                "main_category": main_category,
                "sub_category": sub_category,
                "full_name": subcategory_key,
                "total_points": 0,
                "total_errors": 0,
                "total_uncertainty": 0,
                "total_tasks": 0,
                "total_time": 0,
                "weighted_score": 0
            }

        subcategory_stats[subcategory_key]["total_points"] += points
        subcategory_stats[subcategory_key]["total_errors"] += errors
        subcategory_stats[subcategory_key]["total_uncertainty"] += uncertainty
        subcategory_stats[subcategory_key]["total_tasks"] += 1
        subcategory_stats[subcategory_key]["total_time"] += time_spent
        subcategory_stats[subcategory_key]["weighted_score"] += weighted_score

    subcategories_list = []
    for subcategory_key, stats in subcategory_stats.items():

        denominator = stats["total_points"] + stats["total_errors"] + stats["total_uncertainty"]
        percentage = round((stats["total_points"] / denominator) * 100, 2) if denominator > 0 else 0

        subcategories_list.append({
            "main_category": stats["main_category"],
            "sub_category": stats["sub_category"],
            "full_name": stats["full_name"],
            "total_points": stats["total_points"],
            "total_errors": stats["total_errors"],
            "total_uncertainty": stats["total_uncertainty"],
            "total_tasks": stats["total_tasks"],
            "total_time": stats["total_time"],
            "weighted_score": round(stats["weighted_score"], 2),
            "percentage": percentage
        })

    subcategories_list.sort(key=lambda x: x["weighted_score"], reverse=True)

    denominator = total_points + total_errors + total_uncertainty
    percentage = round((total_points / denominator) * 100, 2) if denominator > 0 else 0

    overall_stats = {
        "total_tasks": total_tasks,
        "weighted_score": round(total_weighted_score, 2),
        "percentage": percentage,
        "total_points": total_points,
        "total_errors": total_errors,
        "total_uncertainty": total_uncertainty,
        "total_time": total_time,
        "avg_time_per_task": round(total_time / total_tasks, 1) if total_tasks > 0 else 0,

    }

    return {
        "overall_stats": overall_stats,
        "subcategories_list": subcategories_list
    }