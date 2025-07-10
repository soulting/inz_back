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
            .from_("lekcja") \
            .select("*") \
            .eq("author_id", user_id) \
            .execute()

        lessons = lessons_response.data

        return jsonify(lessons)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500
