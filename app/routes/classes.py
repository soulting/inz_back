import time
import jwt
import datetime
import os

import bcrypt
from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token

classes_bp = Blueprint('classes', __name__)


@classes_bp.route('/teacher_classes', methods=['GET'])
def get_teacher_classes():
    auth_header = request.headers.get('Authorization')

    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        # Pobierz wszystkie zadania dla danego poziomu
        classes_response = supabase \
            .from_("classes") \
            .select("*") \
            .eq("owner_id", payload["sub"]) \
            .execute()

        classes = classes_response.data

        return jsonify(classes)

    except APIError as e:

        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:

        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@classes_bp.route('/class/<class_id>', methods=['DELETE'])
def delete_teacher_class(class_id):
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    owner_id = payload["sub"]

    try:
        # Sprawdź, czy klasa istnieje i należy do właściciela
        class_response = supabase \
            .from_("classes") \
            .select("*") \
            .eq("id", class_id) \
            .eq("owner_id", owner_id) \
            .single() \
            .execute()

        if not class_response.data:
            return jsonify({"error": "Klasa nie istnieje lub brak dostępu"}), 404

        # Usuń klasę
        supabase \
            .from_("classes") \
            .delete() \
            .eq("id", class_id) \
            .eq("owner_id", owner_id) \
            .execute()

        return jsonify({"message": "Klasa została pomyślnie usunięta"}), 200

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@classes_bp.route('/class', methods=['POST'])
def create_class():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    data = request.get_json()
    name = data.get("name")
    password = data.get("password")
    image_url = data.get("image_url")

    password_hash = None
    if password:
        password_hash = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")

    try:
        supabase.table("classes").insert({
            "name": name,
            "password": password_hash,
            "owner_id": payload["sub"],
            "image_url": image_url
        }).execute()

        return jsonify({"message": "Klasa została pomyślnie utworzona."}), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@classes_bp.route('/student_classes', methods=['GET'])
def get_student_classes():
    auth_header = request.headers.get('Authorization')

    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    try:
        # Pobierz wszystkie klasy z relacją user_classes
        response = supabase \
            .from_("classes") \
            .select("""
                id,
                name,
                image_url,
                owner_id,
                created_at,
                user_classes(user_id)
            """) \
            .execute()

        user_id = payload["sub"]
        classes_raw = response.data

        # Przetwórz klasy i dodaj flagę owned_by_user
        classes_with_flag = []
        for cls in classes_raw:
            owned_by_user = any(uc["user_id"] == user_id for uc in cls.get("user_classes", []))
            classes_with_flag.append({
                "id": cls["id"],
                "name": cls["name"],
                "image_url": cls["image_url"],
                "owner_id": cls["owner_id"],
                "created_at": cls["created_at"],
                "owned_by_user": owned_by_user
            })

        return jsonify(classes_with_flag)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@classes_bp.route('/join_class', methods=['POST'])
def join_class():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()
    class_id = data.get("classID")
    join_password = data.get("joinPassword")

    try:
        response = supabase.table("classes").select("*").eq("id", class_id).single().execute()
        class_data = response.data

        if not class_data:
            return jsonify({"error": "Nie znaleziono klasy"}), 404

        # 🔐 Sprawdź hasło jeśli jest wymagane
        db_password = class_data.get("password")
        if db_password:
            if not join_password:
                return jsonify({"error": "Hasło jest wymagane"}), 400
            if not bcrypt.checkpw(join_password.encode("utf-8"), db_password.encode("utf-8")):
                return jsonify({"error": "Nieprawidłowe hasło"}), 422

        # ➕ Dodaj wpis do tabeli user_classes
        supabase.table("user_classes").insert({
            "user_id": user_id,
            "class_id": class_id,
        }).execute()

        # 🔁 Zwróć zaktualizowaną listę klas z flagą `owned_by_user`
        result = supabase \
            .from_("classes") \
            .select("""
                id,
                name,
                image_url,
                owner_id,
                created_at,
                user_classes(user_id)
            """) \
            .execute()

        classes_with_flag = []
        for cls in result.data:
            owned_by_user = any(uc["user_id"] == user_id for uc in cls.get("user_classes", []))
            classes_with_flag.append({
                "id": cls["id"],
                "name": cls["name"],
                "image_url": cls["image_url"],
                "owner_id": cls["owner_id"],
                "created_at": cls["created_at"],
                "owned_by_user": owned_by_user
            })

        return jsonify(classes_with_flag)

    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500


@classes_bp.route('/leave_class/<class_id>', methods=['DELETE'])
def leave_class(class_id):
    # 🔐 Autoryzacja użytkownika przez JWT
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"error": error_message}), status_code

    user_id = payload["sub"]

    try:
        # 🗑️ Usuń wpis z tabeli user_classes
        supabase.table("user_classes") \
            .delete() \
            .eq("user_id", user_id) \
            .eq("class_id", class_id) \
            .execute()

        # 🔁 Zwróć zaktualizowaną listę klas z flagą `owned_by_user`
        result = supabase \
            .from_("classes") \
            .select("""
                id,
                name,
                image_url,
                owner_id,
                created_at,
                user_classes(user_id)
            """) \
            .execute()

        classes_with_flag = []
        for cls in result.data:
            owned_by_user = any(uc["user_id"] == user_id for uc in cls.get("user_classes", []))
            classes_with_flag.append({
                "id": cls["id"],
                "name": cls["name"],
                "image_url": cls["image_url"],
                "owner_id": cls["owner_id"],
                "created_at": cls["created_at"],
                "owned_by_user": owned_by_user
            })

        return jsonify(classes_with_flag)

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500
