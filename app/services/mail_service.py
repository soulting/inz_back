
import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from dotenv import load_dotenv
from flask import render_template, current_app


load_dotenv()


def send_email(subject, body, to_email=None, reply_to=None, is_html=False):
    """Podstawowa funkcja wysyłania emaili"""
    from_email = os.getenv("FROM_EMAIL")
    default_to_email = os.getenv("TO_EMAIL")
    password = os.getenv("EMAIL_PASSWD")
    smtp_server = os.getenv("SMTP_SERVER")
    port = int(os.getenv("SMTP_PORT", 587))

    recipient = to_email or default_to_email

    msg = MIMEMultipart()
    msg["From"] = "Czas na niemiecki"
    msg["To"] = recipient
    msg["Subject"] = subject

    if reply_to:
        msg['Reply-To'] = reply_to

    content_type = "html" if is_html else "plain"
    msg.attach(MIMEText(body, content_type))

    try:
        server = smtplib.SMTP(smtp_server, port)
        server.starttls()
        server.login(from_email, password)
        server.sendmail(from_email, recipient, msg.as_string())
        server.quit()

        print("wysłany")
        return True, "E-mail wysłany pomyślnie!"
    except Exception as e:
        return False, f"Błąd: {e}"


def send_activation_email(name, user_email, user_id):
    base_url = os.getenv("BASE_URL", "http://localhost:5000")
    activation_link = f"{base_url}/auth/activate/{user_id}"

    try:
        html_body = render_template(
            "emails/simple_activation.html",
            name=name,
            email=user_email,
            activation_link=activation_link,
            user_id=user_id
        )

        return send_email(
            subject="Aktywuj swoje konto",
            body=html_body,
            to_email=user_email,
            is_html=True
        )

    except Exception as e:
        return False, f"{e}"


def send_welcome_email(name, user_email):
    """Email powitalny (po aktywacji)"""
    try:
        html_body = render_template('emails/welcome.html', name=name, email=user_email)
        return send_email(
            subject="Witamy w naszym serwisie!",
            body=html_body,
            to_email=user_email,
            is_html=True
        )
    except Exception as e:
        return False, f"Błąd renderowania szablonu: {e}"


def send_password_reset_email(user_email, user_id):
    base_url = os.getenv("BASE_URL", "http://localhost:5000")
    reset_link = f"{base_url}/auth/reset-password/{user_id}"

    try:
        html_body = render_template(
            "emails/password_reset.html",
            email=user_email,
            reset_link=reset_link,
            user_id=user_id
        )

        return send_email(
            subject="Resetowanie hasła",
            body=html_body,
            to_email=user_email,
            is_html=True
        )

    except Exception as e:
        return False, f"{e}"






