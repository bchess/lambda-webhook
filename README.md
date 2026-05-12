# Python Lambda Webhook

This project deploys a simple Flask-based webhook to AWS Lambda behind an API Gateway HTTP API.

## Layout

- `src/app.py` contains the Flask app and Lambda handler.
- `src/requirements.txt` lists runtime dependencies: Flask, requests, and the WSGI adapter.
- `scripts/build_lambda.sh` installs dependencies into the Lambda package directory.
- `terraform/` creates the Lambda function, IAM role, CloudWatch logs, and public HTTP endpoint.

## Prerequisites

- Python 3.12
- Terraform
- AWS credentials configured for the target account

## Deploy

```sh
cd terraform
terraform init
terraform apply
```

Terraform runs the packaging script automatically, then creates `dist/lambda.zip`. After apply completes, use the `webhook_url` output.

## Local handler shape

The route in `src/app.py` responds to:

- `GET /`
- `GET /webhook`
- `POST /webhook`

Edit `webhook()` in `src/app.py` to add your integration logic. The `requests` package is available inside the Lambda bundle.
