# app.py

from flask import Flask, jsonify


app = Flask(__name__)


@app.route("/")
def home():
    return jsonify(
        status="success",
        message="The new commit system is now working!",
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
