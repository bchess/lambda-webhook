variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Name prefix for AWS resources."
  type        = string
  default     = "lambda-webhook"
}

variable "lambda_timeout_seconds" {
  description = "Lambda timeout in seconds."
  type        = number
  default     = 10
}

variable "lambda_memory_mb" {
  description = "Lambda memory size in MB."
  type        = number
  default     = 256
}

variable "log_retention_days" {
  description = "CloudWatch log retention in days."
  type        = number
  default     = 14
}

variable "echo_url" {
  description = "Optional URL the webhook can POST its JSON payload to."
  type        = string
  default     = ""
}

variable "custom_domain_name" {
  description = "Optional custom domain for the API, such as webhook.example.com. Leave empty to use the default API Gateway URL."
  type        = string
  default     = ""
}

variable "route53_zone_id" {
  description = "Optional existing public Route53 hosted zone ID used for ACM DNS validation and the API alias record."
  type        = string
  default     = ""
}

variable "route53_zone_name" {
  description = "Optional existing public Route53 hosted zone name, such as example.com. Used only when route53_zone_id is empty."
  type        = string
  default     = ""
}
