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


@tasks_bp.route('/update_task/<task_id>', methods=['PUT'])
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


@tasks_bp.route('/submit_single_task', methods=['POST'])
def submit_single_task():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    try:
        # Sprawdź czy wszystkie wymagane pola są obecne
        required_fields = ['taskId', 'classId', 'scoredAnswers', 'taskPoints', 'taskError',
                           'taskUncertainty', 'difficulty', 'timeSpent', 'completionDate']

        for field in required_fields:
            if field not in data:
                return jsonify({"error": f"Brakuje wymaganego pola: {field}"}), 400

        print(f"Otrzymano dane zadania: taskId={data['taskId']}, classId={data['classId']}")

        # Sprawdź czy zadanie istnieje
        task_response = supabase \
            .from_("tasks") \
            .select("*") \
            .eq("id", data["taskId"]) \
            .single() \
            .execute()

        if not task_response.data:
            return jsonify({"error": "Zadanie nie istnieje"}), 404

        # Sprawdź czy już istnieje wynik dla tego zadania od tego użytkownika
        existing_result = supabase \
            .table("task_results") \
            .select("id") \
            .eq("user_id", user_id) \
            .eq("task_id", data["taskId"]) \
            .execute()

        # Jeśli istnieje, usuń stary wynik
        if existing_result.data:
            print(f"Usuwam stary wynik dla zadania {data['taskId']}")
            supabase \
                .table("task_results") \
                .delete() \
                .eq("user_id", user_id) \
                .eq("task_id", data["taskId"]) \
                .execute()

        # Zapisz nowy wynik zadania (używając tej samej struktury co placement test)
        task_result_insert = {
            "user_id": user_id,
            "task_id": data["taskId"],
            "task_points": data["taskPoints"],
            "task_error": data["taskError"],
            "task_uncertainty": data["taskUncertainty"],
            "difficulty": data["difficulty"],
            "time_spent": data["timeSpent"],
            "completion_date": data["completionDate"]
        }

        result = supabase.table("task_results").insert(task_result_insert).execute()

        if not result.data:
            raise Exception("Nie udało się zapisać wyniku zadania")

        task_result_id = result.data[0]["id"]
        print(f"Zapisano wynik zadania z ID: {task_result_id}")

        # Zapisz szczegółowe odpowiedzi (używając tej samej struktury co placement test)
        if data["scoredAnswers"]:
            for answer_obj in data["scoredAnswers"]:
                # Każdy element to obiekt typu {task_item_id: {point, error, uncertain, myAnswer, correctAnswer}}
                for task_item_id, answer_data in answer_obj.items():
                    supabase.table("answer_items").insert({
                        "task_result_id": task_result_id,
                        "item_id": task_item_id,  # Usunąłem int() - UUID zostaje jako string
                        "point": answer_data["point"],
                        "error": answer_data["error"],
                        "uncertain": answer_data["uncertain"],
                        "my_answer": answer_data["myAnswer"],
                        "correct_answer": answer_data["correctAnswer"]
                    }).execute()

        print(f"Zapisano {len(data['scoredAnswers'])} szczegółowych odpowiedzi")

        # Oblicz podstawowe statystyki
        total_items = len(data["scoredAnswers"])
        percentage = round((data["taskPoints"] / total_items) * 100, 2) if total_items > 0 else 0

        return jsonify({
            "status": "success",
            "message": "Wynik zadania został zapisany pomyślnie",
            "result_id": task_result_id,
            "score": {
                "points": data["taskPoints"],
                "errors": data["taskError"],
                "uncertainty": data["taskUncertainty"],
                "total_items": total_items,
                "percentage": percentage,
                "difficulty_rating": data["difficulty"],
                "time_spent": data["timeSpent"]
            }
        }), 201

    except APIError as e:
        print(f"Supabase API error: {str(e)}")
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        print(f"Unexpected error: {str(e)}")
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500
