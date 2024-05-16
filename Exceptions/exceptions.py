class AuthenticationException(Exception):
    def __init__(self, message="Authentication failed. Please recheck username or password."):
        self.message = message
        super().__init__(self.message)

class ReservationException(Exception):
    def __init__(self, message="Reservation error, unable to initiate Reservation "):
        self.message = message
        super().__init__(self.message)

class VehicleNotFoundException(Exception):
    def __init__(self, message="Vehicle you are looking for is not found."):
        self.message = message
        super().__init__(self.message)

class AdminNotFoundException(Exception):
    def __init__(self, message="Admin user you are looking for not found."):
        self.message = message
        super().__init__(self.message)

class InvalidInputException(Exception):
    def __init__(self, message="Input data entered is Invalid."):
        self.message = message
        super().__init__(self.message)

class DatabaseConnectionException(Exception):
    def __init__(self, message="Database connection error."):
        self.message = message
        super().__init__(self.message)