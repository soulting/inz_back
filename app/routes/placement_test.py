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
    answers = data.get("answers",[]).get("answers",[])


    try:
        for answer in answers:
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
            task_result_id = result.data[0]["id"]



            task_items_result = answer.get("scoredAnswers", [])
            for sub in task_items_result:

                task_items_data = list(sub.values())[0]

                supabase.table("odpowiedz_podpunkt").insert({
                    "wynik_zadania_id": task_result_id,
                    "podpunkt_id": list(sub.keys())[0],
                    "point": task_items_data["point"],
                    "error": task_items_data["error"],
                    "uncertain": task_items_data["uncertain"],
                    "my_answer": task_items_data["myAnswer"],
                    "correct_answer": task_items_data["correctAnswer"]
                }).execute()

        return jsonify({"status": "success"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500







