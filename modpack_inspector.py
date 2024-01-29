from flask import Flask, send_from_directory

app = Flask(__name__, static_folder="static")


@app.route("/")
def serve():
    return send_from_directory(app.static_folder, "index.html")


@app.route("/<path:path>")
def static_proxy(path):
    return app.send_static_file(path)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
