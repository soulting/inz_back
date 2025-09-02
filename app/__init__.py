from flask import Flask
from dotenv import load_dotenv
from flask_cors import CORS
from app.services.error_handler import register_error_handlers
import os

def create_app():
    load_dotenv()
    app = Flask(__name__)
    CORS(app)

    from .routes.auth import auth_bp
    from  .routes.placement_test import placement_test_bp
    from  .routes.classes import classes_bp
    from .routes.tasks import tasks_bp
    from .routes.lessons import lessons_bp
    from .routes.sections import sections_bp
    from .routes.analytics import analytics_bp
    from .routes.settings import settings_bp

    app.register_blueprint(auth_bp, url_prefix="/auth")
    app.register_blueprint(placement_test_bp, url_prefix="/placement_test")
    app.register_blueprint(classes_bp, url_prefix="/classes")
    app.register_blueprint(tasks_bp, url_prefix="/tasks")
    app.register_blueprint(lessons_bp, url_prefix="/lessons")
    app.register_blueprint(sections_bp, url_prefix="/sections")
    app.register_blueprint(analytics_bp, url_prefix="/analytics")
    app.register_blueprint(settings_bp, url_prefix="/settings")

    register_error_handlers(app)

    return app
