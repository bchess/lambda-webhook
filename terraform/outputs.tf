output "webhook_url" {
  description = "Base URL for the API Gateway HTTP API."
  value       = aws_apigatewayv2_api.webhook.api_endpoint
}

output "webhook_endpoint" {
  description = "Webhook URL handled by the Flask app."
  value       = "${aws_apigatewayv2_api.webhook.api_endpoint}/webhook"
}

output "custom_domain_url" {
  description = "Base URL for the custom domain, when enabled."
  value       = var.custom_domain_name == "" ? null : "https://${var.custom_domain_name}"
}

output "custom_domain_webhook_endpoint" {
  description = "Webhook URL for the custom domain, when enabled."
  value       = var.custom_domain_name == "" ? null : "https://${var.custom_domain_name}/webhook"
}

output "lambda_function_name" {
  description = "Name of the deployed Lambda function."
  value       = aws_lambda_function.webhook.function_name
}
