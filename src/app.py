import os

import awsgi
import requests
from flask import Flask, jsonify, request


app = Flask(__name__)


@app.get("/")
def index():
    return jsonify({"ok": True, "service": "lambda-webhook"})


@app.route("/webhook", methods=["GET", "POST"])
def webhook():
    payload = request.get_json(silent=True) or {}

    # Example outbound HTTP capability. Set ECHO_URL to call another service.
    echo_url = os.environ.get("ECHO_URL")
    upstream = None
    if echo_url:
        response = requests.post(echo_url, json=payload, timeout=5)
        upstream = {
            "status_code": response.status_code,
            "body": response.text[:500],
        }

    return jsonify(
        {
            "ok": True,
            "method": request.method,
            "path": request.path,
            "args": request.args.to_dict(flat=False),
            "json": payload,
            "upstream": upstream,
        }
    )


def lambda_handler(event, context):
    return awsgi.response(app, event, context)
