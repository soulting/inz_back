from datetime import datetime

from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token


def should_send_lesson_metrics(time_on_page, char_count, lesson_level='A1', user_difficulty=3):
    reading_speed = 20  # znaków na sekundę
    base_reading_time = char_count / reading_speed  # w sekundach

    # Formalna trudność (na podstawie poziomu lekcji)
    lesson_difficulty_factors = {
        'A1': 1.3,
        'A2': 1.4,
        'B1': 1.5,
        'B2': 1.7,
        'C1': 1.9,
    }
    lesson_factor = lesson_difficulty_factors.get(lesson_level.upper(), 1.5)

    user_factor = 1 + (user_difficulty - 3) * 0.1

    expected_time = int(base_reading_time * 6 * lesson_factor * user_factor)
    min_time = int(base_reading_time * 0.5)
    max_time = int(expected_time * 3)

    print(expected_time)
    print(min_time)
    print(max_time)

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
        # Walidacja długości tekstu, czasu itp. (opcjonalne)
        should_send, expected_time = should_send_lesson_metrics(
            time_on_page=data.get("timeOnPage", 0),
            char_count=len(data.get("context", "")),
            lesson_level=data.get("level", "A1"),
            user_difficulty=data.get("difficulty", 3)
        )

        # if not should_send:
        #     return jsonify({"message": "Dane zostały pominięte — czas spoza zakresu."}), 200

        analytics_data = {
            # "user_id": user_id,
            "user_id": data.get("user_id"),
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
            "expected_time": data.get("expected_time")
        }

        print(analytics_data)


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
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]

    if not lesson_id:
        return jsonify({"error": "Brak parametru lessonId"}), 400

    try:
        # Pobranie wpisów danego użytkownika dla konkretnej klasy
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
            expected = entry.get("expected_time", 60)
            time_ratio = min(entry.get("time_on_page", 0) / expected, 2.0)
            scroll_depth = entry.get("scroll_depth", 0) / 100
            clicks = min(entry.get("clicks", 0), 20) / 20
            moves = min(entry.get("mouse_moves", 0), 500) / 500
            scrolls = min(entry.get("scrolls", 0), 100) / 100

            entry_score = (
                (time_ratio * 0.4) +
                (scroll_depth * 0.3) +
                (clicks * 0.1) +
                (moves * 0.1) +
                (scrolls * 0.1)
            ) * 100

            total_score += min(entry_score, 100)

        engagement_score = int(total_score / len(entries))

        return jsonify({"engagement_score": engagement_score}), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


from collections import defaultdict, Counter

@analytics_bp.route('/get_class_analytics/<class_id>', methods=['GET'])
def get_class_analytics(class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        # Pobierz dane z Supabase
        analytics_res = supabase \
            .from_("lesson_analytics") \
            .select("*") \
            .eq("class_id", class_id) \
            .execute()
        analytics_entries = analytics_res.data or []

        if not analytics_entries:
            return jsonify({"error": "Brak danych"}), 404

        # Lekcje
        lesson_ids = list({e["lesson_id"] for e in analytics_entries})
        lessons_res = supabase \
            .from_("lessons") \
            .select("id, title, main_category, sub_category") \
            .in_("id", lesson_ids) \
            .execute()
        lessons = {l["id"]: l for l in lessons_res.data or []}

        # Użytkownicy
        user_ids = list({e["user_id"] for e in analytics_entries})
        users_res = supabase \
            .from_("users") \
            .select("id, name") \
            .in_("id", user_ids) \
            .execute()
        users = {u["id"]: u["name"] for u in users_res.data or []}

        # Klasa
        class_res = supabase \
            .from_("classes") \
            .select("id, name") \
            .eq("id", class_id) \
            .single() \
            .execute()
        class_info = class_res.data
        if not class_info:
            return jsonify({"error": "Nie znaleziono klasy"}), 404

        # Grupowanie po lekcji
        lessons_output = {}

        for entry in analytics_entries:
            lesson_id = entry["lesson_id"]
            lesson = lessons.get(lesson_id, {})
            user_id = entry["user_id"]
            user_name = users.get(user_id, "Nieznany")

            expected = entry.get("expected_time", 60)
            time_on_page = entry.get("time_on_page", 0)
            clicks = min(entry.get("clicks", 0), 20)

            time_ratio = min(time_on_page / expected, 2.0) if expected else 0
            engagement_score = round(((time_ratio * 0.6) + (clicks / 20 * 0.4)) * 100, 2)

            difficulty = entry.get("difficulty", 0)

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

        # Formatowanie końcowe
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






