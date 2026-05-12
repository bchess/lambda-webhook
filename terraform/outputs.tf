output "webhook_url" {
  description = "Base URL for the API Gateway HTTP API."
  value       = aws_apigatewayv2_api.webhook.api_endpoint
}

output "webhook_endpoint" {
  description = "Webhook URL handled by the Flask app."
  value       = "${aws_apigatewayv2_api.webhook.api_endpoint}/webhook"
}

output "lambda_function_name" {
  description = "Name of the deployed Lambda function."
  value       = aws_lambda_function.webhook.function_name
}
