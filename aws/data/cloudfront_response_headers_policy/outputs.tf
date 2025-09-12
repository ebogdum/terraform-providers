output "arn" {
  description = "The response headers policy ARN"
  value       = data.aws_cloudfront_response_headers_policy.this.arn
}

output "comment" {
  description = "Comment to describe the response headers policy"
  value       = data.aws_cloudfront_response_headers_policy.this.comment
}

output "etag" {
  description = "Current version of the response headers policy"
  value       = data.aws_cloudfront_response_headers_policy.this.etag
}

output "cors_config" {
  description = "Configuration for a set of HTTP response headers that are used for Cross-Origin Resource Sharing (CORS)"
  value       = data.aws_cloudfront_response_headers_policy.this.cors_config
}

output "custom_headers_config" {
  description = "Object that contains an attribute items that contains a list of Custom Headers"
  value       = data.aws_cloudfront_response_headers_policy.this.custom_headers_config
}

output "remove_headers_config" {
  description = "Object that contains an attribute items that contains a list of Remove Headers"
  value       = data.aws_cloudfront_response_headers_policy.this.remove_headers_config
}

output "security_headers_config" {
  description = "A configuration for a set of security-related HTTP response headers"
  value       = data.aws_cloudfront_response_headers_policy.this.security_headers_config
}

output "server_timing_headers_config" {
  description = "Configuration for enabling the Server-Timing header in HTTP responses sent from CloudFront"
  value       = data.aws_cloudfront_response_headers_policy.this.server_timing_headers_config
}

output "name" {
  description = "Unique name to identify the response headers policy"
  value       = data.aws_cloudfront_response_headers_policy.this.name
}

output "id" {
  description = "Identifier for the response headers policy"
  value       = data.aws_cloudfront_response_headers_policy.this.id
}