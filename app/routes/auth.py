import time
import jwt
import datetime
import os

import bcrypt
from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError

auth_bp = Blueprint('auth', __name__)

SECRET_KEY = os.getenv("SECRET_KEY")


@auth_bp.route('/register', methods=['POST'])
def register():
    data = request.json
    email = data.get("email")
    password = data.get("password")
    name = data.get("name")
    role = data.get("role", "student")  # domyślnie student

    if not email or not password or not name:
        return jsonify({"error": "Email, password and name are required"}), 400

    try:
        # Sprawdzenie, czy email lub name już istnieje
        existing_user = (
            supabase.table("users")
            .select("id, email, name")
            .or_(f"email.eq.{email},name.eq.{name}")
            .execute()
        )

        if existing_user.data:
            for user in existing_user.data:
                if user["email"] == email:
                    return jsonify({"error": "email taken"}), 409
                if user["name"] == name:
                    return jsonify({"error": "username taken"}), 409

        # Haszowanie hasła
        password_hash = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")

        # Dodanie użytkownika
        supabase.table("users").insert({
            "email": email,
            "password_hash": password_hash,
            "name": name,
            "role": role,
        }).execute()

        return jsonify({
            "message": "User registered successfully",
            "user": {
                "email": email,
                "name": name,
                "role": role
            }
        }), 201

    except APIError as e:
        return jsonify({"error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"error": f"Unexpected error: {str(e)}"}), 500

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.json
    email = data.get("email")
    password = data.get("password")


    if not email or not password:
        return jsonify({"error": "Email and password are required"}), 400

    try:
        response = supabase.from_("users").select("*").eq("email", email).single().execute()
        user = response.data
    except APIError as e:
        return jsonify({"error": "User not found"}), 404

    if not bcrypt.checkpw(password.encode('utf-8'), user["password_hash"].encode('utf-8')):
        return jsonify({"error": "Invalid password"}), 401

    # expiration = datetime.datetime.utcnow() + datetime.timedelta(hours=24)
    expiration = datetime.datetime.utcnow() + datetime.timedelta(hours=24)
    token = jwt.encode(
        {
            "sub": user["id"],
            "email": user["email"],
            "exp": expiration
        },
        SECRET_KEY,
        algorithm="HS256"
    )

    user_data = {
        "id": user["id"],
        "email": user["email"],
        "name": user.get("name", ""),
        "role":user["role"]
    }

    return jsonify({"user": user_data, "token": token}), 200
