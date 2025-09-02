from flask import jsonify
from postgrest.exceptions import APIError
from werkzeug.exceptions import HTTPException
from .exceptions import EmailAlreadyTakenError, UsernameAlreadyTakenError, UserNotFoundError, InvalidPasswordError, \
    ActivationFailedError


def register_error_handlers(app):

    @app.errorhandler(APIError)
    def handle_api_error(e):
        return jsonify({"error": "Supabase API error", "details": str(e)}), 500

    @app.errorhandler(HTTPException)
    def handle_http_exception(e):
        """Obsługa standardowych wyjątków HTTP (404, 401, 400 itd.)."""
        return jsonify({"error": e.name, "details": e.description}), e.code


    @app.errorhandler(Exception)
    def handle_unexpected_error(e):
        print(f"Unexpected error: {str(e)}")
        return jsonify({"error": "Unexpected server error", "details": str(e)}), 500

    @app.errorhandler(UserNotFoundError)
    def handle_user_not_found(e):
        return jsonify({"error": "User not found"}), 404

    @app.errorhandler(InvalidPasswordError)
    def handle_invalid_password(e):
        return jsonify({"error": "Invalid password"}), 401

    @app.errorhandler(EmailAlreadyTakenError)
    def handle_email_taken(e):
        return jsonify({"error": "Email already taken"}), 409

    @app.errorhandler(UsernameAlreadyTakenError)
    def handle_username_taken(e):
        return jsonify({"error": "Username already taken"}), 409

    @app.errorhandler(ActivationFailedError)
    def handle_activation_failed(e):
        return jsonify({"error": str(e)}), 500



