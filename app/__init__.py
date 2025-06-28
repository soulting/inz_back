from flask import Flask
from dotenv import load_dotenv
from flask_cors import CORS
import os

def create_app():
    load_dotenv()  # wczytaj zmienne środowiskowe
    app = Flask(__name__)
    CORS(app)

    from .routes.auth import auth_bp
    from  .routes.placement_test import placement_test_bp
    from  .routes.classes import classes_bp

    app.register_blueprint(auth_bp, url_prefix="/auth")
    app.register_blueprint(placement_test_bp, url_prefix="/placement_test")
    app.register_blueprint(classes_bp, url_prefix="/classes")

    return app
