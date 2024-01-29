# app.py

from flask import Flask, jsonify


app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        status="success",
        message="CI/CD Pipeline Test Successful again! Newly configured secret!",
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
