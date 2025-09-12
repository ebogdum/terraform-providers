output "arn" {
  description = "The origin request policy ARN."
  value       = data.aws_cloudfront_origin_request_policy.this.arn
}

output "comment" {
  description = "Comment to describe the origin request policy."
  value       = data.aws_cloudfront_origin_request_policy.this.comment
}

output "cookies_config" {
  description = "Object that determines whether any cookies in viewer requests (and if so, which cookies) are included in the origin request key and automatically included in requests that CloudFront sends to the origin."
  value       = data.aws_cloudfront_origin_request_policy.this.cookies_config
}

output "etag" {
  description = "Current version of the origin request policy."
  value       = data.aws_cloudfront_origin_request_policy.this.etag
}

output "headers_config" {
  description = "Object that determines whether any HTTP headers (and if so, which headers) are included in the origin request key and automatically included in requests that CloudFront sends to the origin."
  value       = data.aws_cloudfront_origin_request_policy.this.headers_config
}

output "query_strings_config" {
  description = "Object that determines whether any URL query strings in viewer requests (and if so, which query strings) are included in the origin request key and automatically included in requests that CloudFront sends to the origin."
  value       = data.aws_cloudfront_origin_request_policy.this.query_strings_config
}

output "name" {
  description = "Unique name to identify the origin request policy."
  value       = data.aws_cloudfront_origin_request_policy.this.name
}

output "id" {
  description = "Identifier for the origin request policy."
  value       = data.aws_cloudfront_origin_request_policy.this.id
}