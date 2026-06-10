from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "status": "ok",
        "service": "mqtt-broker"
    }

@app.route("/health")
def health():
    return "healthy", 200

if __name__ == "__main__":
    import os

    port = int(os.environ.get("PORT", 10000))

    app.run(
        host="0.0.0.0",
        port=port
    )