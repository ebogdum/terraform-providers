output "api_gateway_cloudwatch_role_arn" {
  description = "The ARN of the IAM role used by API Gateway for CloudWatch logging."
  value       = aws_iam_role.aws_iam_role_cloudwatch[0].arn
  condition   = var.enable_api_gateway_account
}

output "api_gateway_account_id" {
  description = "The ID of the API Gateway account resource."
  value       = aws_api_gateway_account.aws_api_gateway_account[0].id
  condition   = var.enable_api_gateway_account
}

output "api_gateway_account_throttle_settings" {
  description = "Throttle settings at the account level, including burst and rate limit."
  value       = aws_api_gateway_account.aws_api_gateway_account[0].throttle_settings
  condition   = var.enable_api_gateway_account
}

output "api_gateway_account_features" {
  description = "A list of features supported for the API Gateway account."
  value       = aws_api_gateway_account.aws_api_gateway_account[0].features
  condition   = var.enable_api_gateway_account
}