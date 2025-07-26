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
        tasks_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("owner_id", user_id) \
            .execute()

        tasks = tasks_response.data


        return jsonify(tasks)

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

    print(data)


    try:
        task_insert_response = supabase.from_("tasks").insert({
            "question": data["question"],
            "main_category": data["main_category"],
            "sub_category": data["sub_category"],
            "task_type": data["task_type"],
            "level": data["level"],
            "owner_id": user_id,
            "created_at": datetime.utcnow().isoformat()

        }).execute()

        new_task_id = task_insert_response.data[0]['id']

        task_items = data.get("task_items", [])

        if task_items:
            formatted_task_items = []
            for index, task_item in enumerate(task_items):
                formatted_task_items.append({
                    "task_id": new_task_id,
                    "template": task_item.get("template"),
                    "options": task_item.get("options", None),
                    "correct_answer": task_item.get("correct_answer"),
                    "bonus_information": task_item.get("bonus_information", None),
                    "correct_index": task_item.get("correct_index", None)
                })

            supabase.from_("task_items").insert(formatted_task_items).execute()

        return jsonify({"message": "Zadanie utworzone pomyślnie", "task_id": new_task_id}), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@tasks_bp.route('/get_task_items/<task_id>', methods=['GET'])
def get_task_items(task_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        task_items_response = supabase \
            .from_("task_items") \
            .select("*") \
            .eq("task_id", task_id) \
            .execute()

        task_items = task_items_response.data

        return jsonify({"task_items": task_items})

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500



@tasks_bp.route('/update_task/<int:task_id>', methods=['PUT'])
def update_task(task_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    try:
        supabase.from_("tasks").update({
            "question": data["question"],
            "main_category": data["main_category"],
            "sub_category": data["sub_category"],
            "task_type": data["task_type"],
            "level": data["level"]
        }).eq("id", task_id).eq("owner_id", user_id).execute()


        task_items = data.get("task_items", [])
        for index, task_item in enumerate(task_items):
            task_item_data = {
                "template": task_item.get("template"),
                "options": task_item.get("options", None),
                "correct_answer": task_item.get("correct_answer"),
                "bonus_information": task_item.get("bonus_information", None),
                "correct_index": task_item.get("correct_index", None)
            }

            if "id" in task_item:
                supabase.from_("task_items") \
                    .update(task_item_data) \
                    .eq("id", task_item["id"]) \
                    .eq("task_id", task_id) \
                    .execute()
            else:
                task_item_data["task_id"] = task_id
                supabase.from_("task_items") \
                    .insert(task_item_data) \
                    .execute()

        return jsonify({"message": "Zadanie zaktualizowane pomyślnie"}), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@tasks_bp.route('/delete_teacher_task/<task_id>', methods=['DELETE'])
def delete_teacher_task(task_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    owner_id = payload["sub"]

    try:
        # Sprawdź, czy zadanie istnieje i należy do właściciela
        task_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("id", task_id) \
            .eq("owner_id", owner_id) \
            .single() \
            .execute()

        if not task_response.data:
            return jsonify({"error": "Zadanie nie istnieje lub brak dostępu"}), 404

        # Usuń zadanie
        supabase \
            .from_("tasks") \
            .delete() \
            .eq("id", task_id) \
            .eq("owner_id", owner_id) \
            .execute()

        return jsonify({"message": "Zadanie zostało pomyślnie usunięte"}), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@tasks_bp.route('/get_task/<task_id>', methods=['GET'])
def get_task(task_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        task_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("id", task_id) \
            .single() \
            .execute()

        if task_response.data is None:
            return jsonify({"error": "Zadanie nie istnieje."}), 404

        task = task_response.data

        print("asdfas",task_response.data)

        # Pobierz powiązane task_items
        task_items_response = supabase \
            .from_("task_items") \
            .select("*") \
            .eq("task_id", task_id) \
            .execute()

        task_items = task_items_response.data or []

        # Dołącz task_items do obiektu zadania
        task["task_items"] = task_items

        return jsonify(task)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


