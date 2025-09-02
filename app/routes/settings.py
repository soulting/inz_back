import uuid

import bcrypt
from flask import Blueprint, request, jsonify
from app.services.supabase_client import supabase
from postgrest.exceptions import APIError
from ..services.jwt_check import decode_jwt_token

settings_bp = Blueprint('settings', __name__)


@settings_bp.route('/update_username', methods=['PUT'])
def update_username():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"success": False, "error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()
    username = data['username']

    try:
        existing_user = supabase \
            .from_("users") \
            .select("id") \
            .eq("name", username) \
            .neq("id", user_id) \
            .execute()

        if existing_user.data:
            return jsonify({"success": False, "error": "Ta nazwa użytkownika jest już zajęta"}), 400

        response = supabase \
            .from_("users") \
            .update({"name": username}) \
            .eq("id", user_id) \
            .execute()

        if not response.data:
            return jsonify({"success": False, "error": "Nie znaleziono użytkownika"}), 404

        return jsonify({"success": True, "message": "Nazwa użytkownika została zaktualizowana"}), 200

    except APIError as e:
        return jsonify({"success": False, "error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"success": False, "error": f"Unexpected error: {str(e)}"}), 500


@settings_bp.route('/change_password', methods=['PUT'])
def change_password():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"success": False, "error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    old_password = data['oldPassword']
    new_password = data['newPassword']

    try:
        user_response = supabase \
            .from_("users") \
            .select("password_hash") \
            .eq("id", user_id) \
            .single() \
            .execute()

        if not user_response.data:
            return jsonify({"success": False, "error": "Nie znaleziono użytkownika"}), 404

        if not bcrypt.checkpw(old_password.encode('utf-8'), user_response.data['password_hash'].encode('utf-8')):
            return jsonify({"success": False, "error": "Nieprawidłowe aktualne hasło"}), 400

        new_password_hash = bcrypt.hashpw(new_password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

        response = supabase \
            .from_("users") \
            .update({"password_hash": new_password_hash}) \
            .eq("id", user_id) \
            .execute()

        return jsonify({"success": True, "message": "Hasło zostało zmienione"}), 200

    except APIError as e:
        return jsonify({"success": False, "error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"success": False, "error": f"Unexpected error: {str(e)}"}), 500


@settings_bp.route('/change_profile_picture', methods=['POST'])
def change_profile_picture():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"success": False, "error": error_message}), status_code

    user_id = payload["sub"]

    if 'profile_picture' not in request.files:
        return jsonify({"success": False, "error": "Nie wybrano pliku"}), 400

    file = request.files['profile_picture']

    try:
        file_extension = file.filename.rsplit('.', 1)[1].lower() if '.' in file.filename else 'jpg'
        file_name = f"avatar_{user_id}_{uuid.uuid4().hex}.{file_extension}"
        bucket_name = "inzyniekrka-images"
        content_type = file.mimetype or "image/jpeg"

        file_bytes = file.read()

        response = supabase.storage.from_(bucket_name).upload(
            path=file_name,
            file=file_bytes,
            file_options={
                "content-type": content_type,
                "cache-control": "3600",
                "upsert": "true"
            }
        )

        if isinstance(response, dict) and response.get("error"):
            return jsonify({"success": False, "error": response["error"]["message"]}), 500

        public_result = supabase.storage.from_(bucket_name).get_public_url(file_name)

        supabase.from_("users").update({"profile_image": public_result}).eq("id", user_id).execute()

        return jsonify({
            "success": True,
            "message": "Zdjęcie profilowe zostało zaktualizowane",
            "profile_image": public_result
        }), 200

    except Exception as e:
        return jsonify({"success": False, "error": str(e)}), 500


@settings_bp.route('/update_preferences', methods=['PUT'])
def update_preferences():
    auth_header = request.headers.get('Authorization')
    payload, error_message, status_code = decode_jwt_token(auth_header)

    if not payload:
        return jsonify({"success": False, "error": error_message}), status_code

    user_id = payload["sub"]
    data = request.get_json()

    try:
        update_data = {}

        if 'notifications' in data:
            update_data['notifications'] = bool(data['notifications'])

        if 'cookies' in data:
            update_data['cookies'] = bool(data['cookies'])

        if not update_data:
            return jsonify({"success": False, "error": "Brak prawidłowych danych do aktualizacji"}), 400

        response = supabase \
            .from_("users") \
            .update(update_data) \
            .eq("id", user_id) \
            .execute()

        if not response.data:
            return jsonify({"success": False, "error": "Nie znaleziono użytkownika"}), 404

        return jsonify({
            "success": True,
            "message": "Preferencje zostały zaktualizowane"
        }), 200

    except APIError as e:
        return jsonify({"success": False, "error": f"Supabase API error: {str(e)}"}), 500
    except Exception as e:
        return jsonify({"success": False, "error": f"Unexpected error: {str(e)}"}), 500




