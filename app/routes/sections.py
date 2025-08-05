from datetime import datetime

from flask import Blueprint, request, jsonify
from postgrest.exceptions import APIError

from app.services.supabase_client import supabase
from ..services.jwt_check import decode_jwt_token

sections_bp = Blueprint('sections', __name__)


@sections_bp.route('/create_section', methods=['POST'])
def create_section():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    try:
        section_insert_response = supabase.from_("sections").insert({
            "title": data["title"],
            "content": data["content"],
            "class_id": data["class_id"],
            "is_active": False,
            "created_at": datetime.utcnow().isoformat()
        }).execute()

        new_section_id = section_insert_response.data[0]['id']

        return jsonify({"message": "Sekcja utworzona pomyślnie", "section_id": new_section_id}), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@sections_bp.route('/get_sections/<class_id>', methods=['GET'])
def get_sections(class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        # Pobierz sekcje dla klasy
        sections_resp = supabase \
            .from_("sections") \
            .select("*") \
            .eq("class_id", class_id) \
            .order("created_at", desc=False) \
            .execute()
        sections = sections_resp.data

        # Pobierz lekcje powiązane z klasą
        lessons_resp = supabase \
            .from_("section_lesson") \
            .select("*, lessons(*)") \
            .eq("class_id", class_id) \
            .execute()
        lessons = lessons_resp.data

        # Pobierz zadania powiązane z klasą
        tasks_resp = supabase \
            .from_("section_task") \
            .select("*, tasks(*)") \
            .eq("class_id", class_id) \
            .execute()
        tasks = tasks_resp.data

        for section in sections:
            section["lessons"] = []
            section["tasks"] = []
            for lesson in lessons:
                if lesson["section_id"] == section['id']:
                    section["lessons"].append(lesson['lessons'])

            for task in tasks:
                if task["section_id"] == section['id']:
                    section["tasks"].append(task["tasks"])

        return jsonify(sections), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@sections_bp.route('/add_lesson_to_section', methods=['POST'])
def add_lesson_to_section():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    data = request.get_json()

    section_id = data.get('section_id')
    lesson_id = data.get('lesson_id')
    class_id = data.get('class_id')

    try:
        # Sprawdzenie czy taki wpis już istnieje
        existing = supabase.from_("section_lesson").select("*").eq("section_id", section_id).eq("lesson_id",
                                                                                                lesson_id).execute()

        if existing.data and len(existing.data) > 0:
            return jsonify({"error": "Ta lekcja już znajduje się w sekcji"}), 409

        # Dodanie wpisu jeśli nie istnieje
        response = supabase.from_("section_lesson").insert({
            "section_id": section_id,
            "lesson_id": lesson_id,
            "class_id": class_id,
            "created_at": datetime.utcnow().isoformat()
        }).execute()

        if response.data:
            return jsonify({"message": "Lekcja została dodana do sekcji"}), 201
        else:
            return jsonify({"error": "Nie udało się dodać lekcji"}), 500

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@sections_bp.route('/add_task_to_section', methods=['POST'])
def add_task_to_section():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    data = request.get_json()

    section_id = data.get('section_id')
    task_id = data.get('task_id')
    class_id = data.get('class_id')

    try:
        # Sprawdzenie czy taki wpis już istnieje
        existing = supabase.from_("section_task").select("*") \
            .eq("section_id", section_id) \
            .eq("task_id", task_id) \
            .execute()

        if existing.data and len(existing.data) > 0:
            return jsonify({"error": "To zadanie już znajduje się w sekcji"}), 409

        # Dodanie wpisu jeśli nie istnieje
        response = supabase.from_("section_task").insert({
            "section_id": section_id,
            "task_id": task_id,
            "class_id": class_id,
            "created_at": datetime.utcnow().isoformat()
        }).execute()

        if response.data:
            return jsonify({"message": "Zadanie zostało dodane do sekcji"}), 201
        else:
            return jsonify({"error": "Nie udało się dodać zadania"}), 500

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@sections_bp.route('/remove_task_from_section', methods=['POST'])
def remove_task_from_section():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    data = request.get_json()
    section_id = data.get('section_id')
    task_id = data.get('task_id')

    if not section_id or not task_id:
        return jsonify({"error": "Brakuje wymaganych danych"}), 400

    try:
        response = supabase.from_("section_task") \
            .delete() \
            .eq("section_id", section_id) \
            .eq("task_id", task_id) \
            .execute()

        return jsonify({"message": "Zadanie zostało usunięte z sekcji"}), 200


    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@sections_bp.route('/remove_lesson_from_section', methods=['POST'])
def remove_lesson_from_section():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    data = request.get_json()
    section_id = data.get('section_id')
    lesson_id = data.get('lesson_id')

    if not section_id or not lesson_id:
        return jsonify({"error": "Brakuje wymaganych danych"}), 400

    try:
        response = supabase.from_("section_lesson") \
            .delete() \
            .eq("section_id", section_id) \
            .eq("lesson_id", lesson_id) \
            .execute()

        return jsonify({"message": "Lekcja została usunięta z sekcji"}), 200


    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500
