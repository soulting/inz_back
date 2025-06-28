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
        zadania_response = supabase \
            .from_("zadanie") \
            .select("*") \
            .eq("level", level) \
            .execute()


        zadania = zadania_response.data

        # Dla każdego zadania pobierz podpunkty
        for zadanie in zadania:
            podpunkty_response = supabase \
                .from_("podpunkt") \
                .select("*") \
                .eq("task_id", zadanie["id"]) \
                .order("sequence") \
                .execute()

            zadanie["subtasks"] = podpunkty_response.data if podpunkty_response.data else []

        return jsonify(zadania)


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
            zadanie_insert = {
                "user_id": user_id,
                "zadanie_id": answer["taskId"],
                "task_points": answer["taskPoints"],
                "task_error": answer["taskError"],
                "task_uncertainty": answer["taskUncertainty"],
                "difficulty": answer["difficulty"],
                "time_spent": answer["timeSpent"],
                "completion_date": answer["completionDate"]
            }

            result = supabase.table("wynik_zadania").insert(zadanie_insert).execute()
            wynik_zadania_id = result.data[0]["id"]



            subtasks = answer.get("scoredAnswers", [])
            for sub in subtasks:

                podpunkt_dane = list(sub.values())[0]

                supabase.table("odpowiedz_podpunkt").insert({
                    "wynik_zadania_id": wynik_zadania_id,
                    "podpunkt_id": list(sub.keys())[0],
                    "point": podpunkt_dane["point"],
                    "error": podpunkt_dane["error"],
                    "uncertain": podpunkt_dane["uncertain"],
                    "my_answer": podpunkt_dane["myAnswer"],
                    "correct_answer": podpunkt_dane["correctAnswer"]
                }).execute()

        return jsonify({"status": "success"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500







