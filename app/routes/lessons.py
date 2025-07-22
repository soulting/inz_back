from datetime import datetime

from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token

lessons_bp = Blueprint('lessons_bp', __name__)

@lessons_bp.route('/get_teacher_lessons', methods=['GET'])
def get_teacher_lessons():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]

    try:
        # Pobierz wszystkie lekcje użytkownika (author_id)
        lessons_response = supabase \
            .from_("lessons") \
            .select("*") \
            .eq("owner_id", user_id) \
            .execute()

        lessons = lessons_response.data

        return jsonify(lessons)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@lessons_bp.route('/create_lesson', methods=['POST'])
def create_lesson():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    owner_id = payload["sub"]
    data = request.get_json()

    try:

        lesson_data = {
            "title": data["title"],
            "description": data.get("description", ""),
            "context": data.get("context", ""),
            "owner_id": owner_id,
            "main_category": data["main_category"],
            "sub_category": data["sub_category"],
            "level": data["level"],
        }

        response = supabase \
            .from_("lessons") \
            .insert(lesson_data) \
            .execute()


        return jsonify({
            "message": "Lekcja została utworzona.",
            "lesson": response.data[0]
        }), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@lessons_bp.route('/get_lesson/<lesson_id>', methods=['GET'])
def get_lesson(lesson_id):

    try:
        response = supabase \
            .from_("lessons") \
            .select("*") \
            .eq("id", lesson_id) \
            .single() \
            .execute()

        lesson = response.data

        if lesson is None:
            return jsonify({"error": "Lekcja nie została znaleziona."}), 404

        return jsonify(lesson), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@lessons_bp.route('/delete_lesson/<lesson_id>', methods=['DELETE'])
def delete_teacher_lesson(lesson_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    owner_id = payload["sub"]

    try:
        # Sprawdź, czy lekcja istnieje i należy do właściciela
        lesson_response = supabase \
            .from_("lessons") \
            .select("*") \
            .eq("id", lesson_id) \
            .eq("owner_id", owner_id) \
            .single() \
            .execute()

        if not lesson_response.data:
            return jsonify({"error": "Lekcja nie istnieje lub brak dostępu"}), 404

        # Usuń lekcję
        supabase \
            .from_("lessons") \
            .delete() \
            .eq("id", lesson_id) \
            .eq("owner_id", owner_id) \
            .execute()

        # Pobierz zaktualizowaną listę lekcji właściciela
        updated_lessons = supabase \
            .from_("lessons") \
            .select("*") \
            .eq("owner_id", owner_id) \
            .order("created_at", desc=True) \
            .execute()

        return jsonify(updated_lessons.data), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@lessons_bp.route('/update_lesson/<lesson_id>', methods=['PUT'])
def update_lesson(lesson_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    owner_id = payload["sub"]
    data = request.get_json()

    try:
        # Sprawdź, czy lekcja istnieje i należy do właściciela
        lesson_response = supabase \
            .from_("lessons") \
            .select("*") \
            .eq("id", lesson_id) \
            .eq("owner_id", owner_id) \
            .single() \
            .execute()

        if not lesson_response.data:
            return jsonify({"error": "Lekcja nie istnieje lub brak dostępu"}), 404

        # Przygotowanie danych do aktualizacji
        lesson_update = {
            "title": data["title"],
            "description": data.get("description", ""),
            "context": data.get("context", ""),
            "main_category": data["main_category"],
            "sub_category": data["sub_category"],
            "level": data["level"],
        }

        update_response = supabase \
            .from_("lessons") \
            .update(lesson_update) \
            .eq("id", lesson_id) \
            .eq("owner_id", owner_id) \
            .execute()

        return jsonify({
            "message": "Lekcja została zaktualizowana.",
            "lesson": update_response.data[0]
        }), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

