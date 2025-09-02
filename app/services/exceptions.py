class EmailAlreadyTakenError(Exception):
    """Rzucany, gdy email jest już zajęty."""
    pass

class UsernameAlreadyTakenError(Exception):
    """Rzucany, gdy nazwa użytkownika jest już zajęta."""
    pass

class UserNotFoundError(Exception):
    """Rzucany, gdy użytkownik nie istnieje."""
    pass

class InvalidPasswordError(Exception):
    """Rzucany, gdy hasło jest nieprawidłowe."""
    pass

class ActivationFailedError(Exception):
    """Rzucany, gdy aktywacja konta się nie powiedzie."""
    pass
