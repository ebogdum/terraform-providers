output "api_gateway_api_key_ids" {
  description = "List of API Gateway API key IDs."
  value       = [for k in aws_api_gateway_api_key.aws_api_gateway_api_key : k.id]
}

output "api_gateway_api_key_arns" {
  description = "List of API Gateway API key ARNs."
  value       = [for k in aws_api_gateway_api_key.aws_api_gateway_api_key : k.arn]
}

output "api_gateway_api_key_values" {
  description = "List of API Gateway API key values. Only populated if 'value' was set manually."
  value       = [for k in var.api_keys : k.value]
  sensitive   = true
}
