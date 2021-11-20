from app import create_app
from app.settings import DEBUG, HOST, PORT

app = create_app()


@app.route("/healthcheck")
def health_check():
    return {
        "message": "api-template status is OK"
    }, 200


if __name__ == "__main__":
    app.run(host=HOST, port=PORT, debug=DEBUG)
