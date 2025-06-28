import os

import jwt
from jwt.exceptions import ExpiredSignatureError, InvalidTokenError

SECRET_KEY = os.getenv("SECRET_KEY")

def decode_jwt_token(auth_header: str):
    if not auth_header:
        return None, "Brak nagłówka Authorization", 401

    if not auth_header.startswith("Bearer "):
        return None, "Niepoprawny format tokena", 401

    token = auth_header.split(" ")[1]

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=["HS256"])
        return payload, None, 200
    except ExpiredSignatureError:
        return None, "Token wygasł", 401
    except InvalidTokenError:
        return None, "Nieprawidłowy token", 401
