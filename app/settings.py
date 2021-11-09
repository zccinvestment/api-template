from os import getenv

# Flask app
HOST = getenv("HOST", "127.0.0.1")
PORT = getenv("PORT", "5000")
DEBUG = getenv("DEBUG", "False")

# Logging
LOG_LEVEL = int(getenv("LOG_LEVEL", "20"))
SERVICE_NAME = "API-TEMPLATE"
