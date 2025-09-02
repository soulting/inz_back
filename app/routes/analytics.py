from datetime import datetime

from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token
from collections import defaultdict, Counter
from ..services.helpers.difficulty import compute_difficulty_factor
from ..services.helpers.engagement import compute_engagement_score


def should_send_lesson_metrics(time_on_page, char_count, lesson_level='A1', user_difficulty=3):
    reading_speed = 17
    base_reading_time = char_count / reading_speed

    lesson_difficulty_factors = {
        'A1': 1.3,
        'A2': 1.4,
        'B1': 1.5,
    }
    lesson_factor = lesson_difficulty_factors.get(lesson_level.upper(), 1.5)

    user_factor = compute_difficulty_factor(user_difficulty)

    expected_time = int(base_reading_time * 6 * lesson_factor * user_factor)
    min_time = int(base_reading_time * 0.5)
    max_time = int(expected_time * 3)

    return min_time <= time_on_page <= max_time, expected_time

analytics_bp = Blueprint('analytics_bp', __name__)

@analytics_bp.route('/save_lesson_analytics', methods=['POST'])
def create_lesson_analytics():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    try:
        should_send, expected_time = should_send_lesson_metrics(
            time_on_page=data.get("timeOnPage", 0),
            char_count=len(data.get("context", "")),
            lesson_level=data.get("level", "A1"),
            user_difficulty=data.get("difficulty", 3)
        )

        if not should_send:
            return jsonify({"message": "Dane zostały pominięte — czas spoza zakresu."}), 200

        analytics_data = {
            "user_id": user_id,
            "class_id": data.get("classId"),
            "section_id": data.get("sectionId"),
            "lesson_id": data.get("lessonId"),
            "time_on_page": data.get("timeOnPage"),
            "mouse_moves": data.get("mouseMoves"),
            "scrolls": data.get("scrolls"),
            "scroll_depth": data.get("scrollDepth"),
            "clicks": data.get("clicks"),
            "difficulty": data.get("difficulty"),
            "level": data.get("level"),
            "main_category": data.get("main_category"),
            "sub_category": data.get("sub_category"),
            "expected_time": expected_time
        }

        response = supabase \
            .from_("lesson_analytics") \
            .insert(analytics_data) \
            .execute()

        return jsonify({"message": "Dane analityczne zapisane poprawnie."}), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@analytics_bp.route('/get_lesson_engagement_score/<lesson_id>', methods=['GET'])
def get_engagement_score(lesson_id):
    print("sdafdsafasdfad")
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]

    if not lesson_id:
        return jsonify({"error": "Brak parametru lessonId"}), 400

    try:

        response = supabase \
            .from_("lesson_analytics") \
            .select("*") \
            .eq("lesson_id", lesson_id) \
            .execute()

        entries = response.data

        if not entries:
            return jsonify({"engagement_score": 0}), 200

        total_score = 0

        for entry in entries:
            expected = entry.get("expected_time")
            time_on_page = entry.get("time_on_page")
            scroll_depth = entry.get("scroll_depth")
            clicks =entry.get("clicks")
            moves = entry.get("mouse_moves")
            scrolls = entry.get("scrolls")
            difficulty = entry.get("difficulty")

            # entry_score = (
            #     (time_ratio * 0.4) +
            #     (scroll_depth * 0.3) +
            #     (clicks * 0.1) +
            #     (moves * 0.1) +
            #     (scrolls * 0.1)
            # ) * 100

            entry_score = compute_engagement_score(time_on_page, expected, scroll_depth, clicks ,moves, scrolls,difficulty )
            print(entry_score)

            total_score += min(entry_score, 100)

        engagement_score = int(total_score / len(entries))

        return jsonify({"engagement_score": engagement_score}), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@analytics_bp.route('/get_class_analytics/<class_id>', methods=['GET'])
def get_class_analytics(class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)


    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        class_res = supabase \
            .from_("classes") \
            .select("id, name") \
            .eq("id", class_id) \
            .single() \
            .execute()
        class_info = class_res.data
        if not class_info:
            return jsonify({"error": "Nie znaleziono klasy"}), 404

        analytics_res = supabase \
            .from_("lesson_analytics") \
            .select("*") \
            .eq("class_id", class_id) \
            .execute()
        analytics_entries = analytics_res.data or []

        if not analytics_entries:
            return jsonify({
                "class_id": class_info["id"],
                "class_name": class_info["name"],
                "lessons": []
            }), 200


        lesson_ids = list({e["lesson_id"] for e in analytics_entries})
        lessons_res = supabase \
            .from_("lessons") \
            .select("id, title, main_category, sub_category") \
            .in_("id", lesson_ids) \
            .execute()
        lessons = {l["id"]: l for l in lessons_res.data or []}

        user_ids = list({e["user_id"] for e in analytics_entries})
        users_res = supabase \
            .from_("users") \
            .select("id, name") \
            .in_("id", user_ids) \
            .execute()
        users = {u["id"]: u["name"] for u in users_res.data or []}

        lessons_output = {}

        for entry in analytics_entries:
            lesson_id = entry["lesson_id"]
            lesson = lessons.get(lesson_id, {})
            user_id = entry["user_id"]
            user_name = users.get(user_id, "Nieznany")

            expected = entry.get("expected_time")
            time_on_page = entry.get("time_on_page")
            scroll_depth =entry.get("scroll_depth")
            clicks = entry.get("clicks", )
            mouse_moves =entry.get("mouse_moves")
            scrolls = entry.get("scrolls")
            difficulty = entry.get("difficulty")
            time_ratio = min(time_on_page / expected, 2.0) if expected else 0
            # engagement_score = round(((time_ratio * 0.6) + (clicks / 20 * 0.4)) * 100, 2)
            engagement_score = compute_engagement_score(time_on_page,expected, scroll_depth,clicks, mouse_moves, scrolls, difficulty )



            if lesson_id not in lessons_output:
                lessons_output[lesson_id] = {
                    "lesson_id": lesson_id,
                    "lesson_name": lesson.get("title", "Nieznana lekcja"),
                    "main_category": lesson.get("main_category", ""),
                    "sub_category": lesson.get("sub_category", ""),
                    "users": [],
                    "difficulty": Counter(),
                    "time_on_page": [],
                    "expected_time": [],
                    "engagement_score": []
                }

            lessons_output[lesson_id]["users"].append({
                "user_id": user_id,
                "user_name": user_name,
                "time_on_page": time_on_page,
                "difficulty": difficulty,
                "engagement_score": engagement_score
            })

            if difficulty in range(1, 6):
                lessons_output[lesson_id]["difficulty"][difficulty] += 1
            lessons_output[lesson_id]["time_on_page"].append(time_on_page)
            lessons_output[lesson_id]["expected_time"].append(expected)
            lessons_output[lesson_id]["engagement_score"].append(engagement_score)

        formatted_lessons = []

        for lesson in lessons_output.values():
            formatted_lessons.append({
                "lesson_id": lesson["lesson_id"],
                "lesson_name": lesson["lesson_name"],
                "main_category": lesson["main_category"],
                "sub_category": lesson["sub_category"],
                "difficulty": {str(i): lesson["difficulty"].get(i, 0) for i in range(1, 6)},
                "time_on_page": round(sum(lesson["time_on_page"]) / len(lesson["time_on_page"]), 1),
                "expected_time": round(sum(lesson["expected_time"]) / len(lesson["expected_time"]), 1),
                "engagement_score": round(sum(lesson["engagement_score"]) / len(lesson["engagement_score"]), 1),
                "users": lesson["users"]
            })

        return jsonify({
            "class_id": class_info["id"],
            "class_name": class_info["name"],
            "lessons": formatted_lessons
        }), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@analytics_bp.route('/get_class_performance_analysis/<class_id>/<level>', methods=['GET'])
def get_class_performance_analysis(class_id, level):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        class_users_res = supabase \
            .from_("user_classes") \
            .select("user_id") \
            .eq("class_id", class_id) \
            .execute()

        user_ids = [cu["user_id"] for cu in (class_users_res.data or [])]

        if not user_ids:
            return jsonify({"error": "Brak uczniów w klasie lub klasa nie istnieje"}), 404

        print(f"Znaleziono {len(user_ids)} uczniów w klasie {class_id} dla poziomu {level}")

        task_results_res = supabase \
            .from_("task_results") \
            .select("""
                task_points, 
                task_error, 
                task_uncertainty,
                difficulty,
                user_id,
                tasks!inner (
                    main_category,
                    sub_category,
                    level
                )
            """) \
            .in_("user_id", user_ids) \
            .eq("tasks.level", level) \
            .execute()

        task_results = task_results_res.data or []

        if not task_results:
            return jsonify({
                "error": f"Brak wyników testów dla poziomu {level} w tej klasie",
                "class_id": class_id,
                "level": level,
                "subcategories": []
            }), 404


        class_res = supabase \
            .from_("classes") \
            .select("id, name") \
            .eq("id", class_id) \
            .single() \
            .execute()

        class_info = class_res.data
        if not class_info:
            return jsonify({"error": "Nie znaleziono klasy"}), 404

        subcategory_stats = {}

        for result in task_results:
            task_info = result.get("tasks", {})
            main_category = task_info.get("main_category", "Nieznana kategoria")
            sub_category = task_info.get("sub_category", "Nieznana podkategoria")

            points = result.get("task_points", 0)
            errors = result.get("task_error", 0)
            uncertainty = result.get("task_uncertainty", 0)
            difficulty = result.get("difficulty", 3)

            total_possible = points + errors + uncertainty

            sub_key = f"{main_category}#{sub_category}"

            if sub_key not in subcategory_stats:
                subcategory_stats[sub_key] = {
                    "main_category": main_category,
                    "sub_category": sub_category,
                    "total_points": 0,
                    "total_possible": 0,
                    "total_errors": 0,
                    "total_uncertainty": 0,
                    "total_difficulty": 0,
                    "total_tasks": 0
                }

            subcategory_stats[sub_key]["total_points"] += points
            subcategory_stats[sub_key]["total_possible"] += total_possible
            subcategory_stats[sub_key]["total_errors"] += errors
            subcategory_stats[sub_key]["total_uncertainty"] += uncertainty
            subcategory_stats[sub_key]["total_difficulty"] += difficulty
            subcategory_stats[sub_key]["total_tasks"] += 1

        subcategories_analysis = []

        for sub_key, stats in subcategory_stats.items():
            score_percentage = (stats["total_points"] / stats["total_possible"] * 100) if stats[
                                                                                              "total_possible"] > 0 else 0
            error_rate = (stats["total_errors"] / stats["total_possible"] * 100) if stats["total_possible"] > 0 else 0
            uncertainty_rate = (stats["total_uncertainty"] / stats["total_possible"] * 100) if stats[
                                                                                                   "total_possible"] > 0 else 0
            avg_difficulty = stats["total_difficulty"] / stats["total_tasks"] if stats["total_tasks"] > 0 else 0

            subcategories_analysis.append({
                "main_category": stats["main_category"],
                "sub_category": stats["sub_category"],
                "score_percentage": round(score_percentage, 1),
                "error_rate": round(error_rate, 1),
                "uncertainty_rate": round(uncertainty_rate, 1),
                "difficulty": round(avg_difficulty, 1)
            })

        subcategories_analysis.sort(key=lambda x: x["score_percentage"])

        return jsonify({
            "class_info": {
                "class_id": class_info["id"],
                "class_name": class_info["name"],
                "level": level,
                "total_students": len(user_ids),
                "total_results_analyzed": len(task_results)
            },
            "subcategories": subcategories_analysis
        }), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@analytics_bp.route('/get_task_analytics/<class_id>', methods=['GET'])
def get_task_analytics(class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        task_results_res = supabase \
            .from_("task_results") \
            .select("""
                task_id,
                user_id,
                task_points,
                task_error,
                task_uncertainty,
                time_spent,
                difficulty,
                completion_date,
                users!inner (
                    name
                ),
                tasks!inner (
                    question,
                    task_type,
                    level,
                    main_category,
                    sub_category
                )
            """) \
            .eq("class_id", class_id) \
            .execute()

        task_results = task_results_res.data or []

        if not task_results:
            return jsonify({
                "class_id": class_id,
                "total_tasks": 0,
                "tasks": []
            }), 200

        tasks_dict = {}

        for result in task_results:
            task_id = result.get("task_id")
            user_info = result.get("users", {})
            task_info = result.get("tasks", {})

            if task_id not in tasks_dict:
                tasks_dict[task_id] = {
                    "task_id": task_id,
                    "question": task_info.get("question", ""),
                    "main_category": task_info.get("main_category", ""),
                    "sub_category": task_info.get("sub_category", "") or "",
                    "task_type": task_info.get("task_type", ""),
                    "level": task_info.get("level", ""),
                    "students_count": 0,
                    "task_points": 0,
                    "task_error": 0,
                    "task_uncertainty": 0,
                    "time_spent": 0,
                    "difficulty": 0,
                    "difficulty_count": 0,
                    "student_results": []
                }

            student_result = {
                "user_id": result.get("user_id"),
                "student_name": user_info.get("name", "Nieznany"),
                "task_points": result.get("task_points", 0),
                "task_error": result.get("task_error", 0),
                "task_uncertainty": result.get("task_uncertainty", 0),
                "time_spent": result.get("time_spent", 0),
                "difficulty": result.get("difficulty"),
                "completion_date": result.get("completion_date")
            }

            tasks_dict[task_id]["student_results"].append(student_result)

            task_data = tasks_dict[task_id]
            task_data["task_points"] += result.get("task_points", 0)
            task_data["task_error"] += result.get("task_error", 0)
            task_data["task_uncertainty"] += result.get("task_uncertainty", 0)
            task_data["time_spent"] += result.get("time_spent", 0)

            if result.get("difficulty") is not None:
                task_data["difficulty"] += result.get("difficulty", 0)
                task_data["difficulty_count"] += 1

        tasks_list = []
        for task_data in tasks_dict.values():
            task_data["students_count"] = len({sr["user_id"] for sr in task_data["student_results"]})

            if task_data["difficulty_count"] > 0:
                task_data["difficulty"] = round(task_data["difficulty"] / task_data["difficulty_count"], 1)
            else:
                task_data["difficulty"] = 3.0

            del task_data["difficulty_count"]

            task_data["student_results"].sort(key=lambda x: x["student_name"])

            tasks_list.append(task_data)

        tasks_list.sort(key=lambda x: (x["main_category"], x["level"], x["question"]))

        response = {
            "class_id": class_id,
            "total_tasks": len(tasks_list),
            "tasks": tasks_list
        }

        return jsonify(response), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@analytics_bp.route('/get_task_item_analytics/<class_id>/<task_id>', methods=['GET'])
def get_task_item_analytics(task_id, class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)
    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        task_results_res = supabase \
            .from_("task_results") \
            .select("id,user_id") \
            .eq("task_id", task_id) \
            .eq("class_id", class_id) \
            .execute()

        task_results = task_results_res.data or []
        if not task_results:
            return jsonify({
                "task_id": task_id,
                "class_id": class_id,
                "items": []
            }), 200

        task_result_ids = [tr["id"] for tr in task_results]

        task_items_res = supabase \
            .from_("task_items") \
            .select("*") \
            .eq("task_id", task_id) \
            .execute()

        task_items = task_items_res.data or []

        answer_items_res = supabase \
            .from_("answer_items") \
            .select("*") \
            .in_("task_result_id", task_result_ids) \
            .execute()

        answer_items = answer_items_res.data or []

        items_stats = []
        for item in task_items:
            item_id = item["id"]
            answers_for_item = [a for a in answer_items if a["item_id"] == item_id]

            stats = {
                "item_id": item_id,
                "template": item["template"],
                "bonus_information": item["bonus_information"],
                "correct_answer": item["correct_answer"],
                "total_answers": len(answers_for_item),
                "correct": sum(a["point"] for a in answers_for_item),
                "incorrect": sum(a["error"] for a in answers_for_item),
                "uncertain": sum(a["uncertain"] for a in answers_for_item)
            }
            items_stats.append(stats)




        print(items_stats)
        return jsonify({
            "task_id": task_id,
            "class_id": class_id,
            "items": items_stats
        }), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
