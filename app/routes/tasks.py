from datetime import datetime

from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token

tasks_bp = Blueprint('tasks', __name__)


@tasks_bp.route('/get_teacher_tasks', methods=['GET'])
def get_teacher_tasks():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]

    try:
        # Pobierz wszystkie zadania użytkownika (creator_id)
        zadania_response = supabase \
            .from_("zadanie") \
            .select("*") \
            .eq("creator_id", user_id) \
            .execute()

        zadania = zadania_response.data


        return jsonify(zadania)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@tasks_bp.route('/create_task', methods=['POST'])
def create_task():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()


    try:
        # Wstaw zadanie do tabeli "zadanie"
        task_insert_response = supabase.from_("zadanie").insert({
            "question": data["question"],
            "main_category": data["selectedMainCategory"],
            "first_category": data["selectedFirstCategory"],
            "task_type": data["taskType"],
            "level": data["level"],
            "creator_id": user_id,
            "created_at": datetime.utcnow().isoformat()

        }).execute()

        # Pobierz ID nowo utworzonego zadania
        new_task_id = task_insert_response.data[0]['id']

        # Wstaw subpunkty (jeśli istnieją) do tabeli "subpoints"
        subpoints = data.get("subpoints", [])

        if subpoints:
            formatted_subpoints = []
            for index, point in enumerate(subpoints):

                formatted_subpoints.append({
                    "task_id": new_task_id,
                    "question": point.get("originalSentence"),
                    "options": point.get("options", None),
                    "correct_answer": point.get("correctedSentence"),
                    "points": point.get("points", 1),
                    "sequence": index + 1,
                    "hint": point.get("tips", None)
                })

            supabase.from_("podpunkt").insert(formatted_subpoints).execute()

        return jsonify({"message": "Zadanie utworzone pomyślnie", "task_id": new_task_id}), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500







