# app/email_service.py
import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from dotenv import load_dotenv
from flask import render_template, current_app


load_dotenv()

def render_email_template(name, user_email, user_id, template):
    base_path = os.path.join(os.path.dirname(__file__), "../templates/emails")
    template_path = os.path.join(base_path, "simple_activation.html")

    with open(template_path, "r", encoding="utf-8") as f:
        html = f.read()

    base_url = os.getenv("BASE_URL", "http://localhost:5000/auth")
    activation_link = f"{base_url}/activate/{user_id}"

    html = html.replace("{{ name }}", name)
    html = html.replace("{{ email }}", user_email)
    html = html.replace("{{ activation_link }}", activation_link)

    return html


def send_email(subject, body, to_email=None, reply_to=None, is_html=False):
    """Podstawowa funkcja wysyłania emaili"""
    from_email = os.getenv("FROM_EMAIL")
    default_to_email = os.getenv("TO_EMAIL")
    password = os.getenv("EMAIL_PASSWD")
    smtp_server = os.getenv("SMTP_SERVER")
    port = int(os.getenv("SMTP_PORT", 587))

    recipient = to_email or default_to_email

    msg = MIMEMultipart()
    msg["From"] = f"{os.getenv('FROM_NAME', 'Email Service')} <{from_email}>"
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


def send_contact_form(name, user_email, message):
    """Email z formularza kontaktowego"""
    return send_email(
        subject=f"Nowa wiadomość od {name}",
        body=f"Otrzymałeś nową wiadomość:\n\nOd: {name}\nEmail: {user_email}\n\nWiadomość:\n{message}",
        reply_to=user_email
    )