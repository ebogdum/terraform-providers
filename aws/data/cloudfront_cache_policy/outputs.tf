output "arn" {
  description = "The cache policy ARN"
  value       = data.aws_cloudfront_cache_policy.this.arn
}

output "etag" {
  description = "Current version of the cache policy"
  value       = data.aws_cloudfront_cache_policy.this.etag
}

output "min_ttl" {
  description = "Minimum amount of time, in seconds, that you want objects to stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated"
  value       = data.aws_cloudfront_cache_policy.this.min_ttl
}

output "max_ttl" {
  description = "Maximum amount of time, in seconds, that objects stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated"
  value       = data.aws_cloudfront_cache_policy.this.max_ttl
}

output "default_ttl" {
  description = "Default amount of time, in seconds, that you want objects to stay in the CloudFront cache before CloudFront sends another request to the origin to see if the object has been updated"
  value       = data.aws_cloudfront_cache_policy.this.default_ttl
}

output "comment" {
  description = "Comment to describe the cache policy"
  value       = data.aws_cloudfront_cache_policy.this.comment
}

output "parameters_in_cache_key_and_forwarded_to_origin" {
  description = "The HTTP headers, cookies, and URL query strings to include in the cache key"
  value       = data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin
}

output "cookies_config" {
  description = "Object that determines whether any cookies in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].cookies_config, null)
}

output "headers_config" {
  description = "Object that determines whether any HTTP headers are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].headers_config, null)
}

output "query_strings_config" {
  description = "Object that determines whether any URL query strings in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].query_strings_config, null)
}

output "enable_accept_encoding_brotli" {
  description = "A flag that can affect whether the Accept-Encoding HTTP header is included in the cache key and included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].enable_accept_encoding_brotli, null)
}

output "enable_accept_encoding_gzip" {
  description = "A flag that can affect whether the Accept-Encoding HTTP header is included in the cache key and included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].enable_accept_encoding_gzip, null)
}

output "cookie_behavior" {
  description = "Determines whether any cookies in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].cookies_config[0].cookie_behavior, null)
}

output "cookies" {
  description = "Object that contains a list of cookie names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].cookies_config[0].cookies, null)
}

output "cookie_items" {
  description = "List of cookie names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].cookies_config[0].cookies[0].items, null)
}

output "header_behavior" {
  description = "Determines whether any HTTP headers are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].headers_config[0].header_behavior, null)
}

output "headers" {
  description = "Object that contains a list of header names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].headers_config[0].headers, null)
}

output "header_items" {
  description = "List of header names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].headers_config[0].headers[0].items, null)
}

output "query_string_behavior" {
  description = "Determines whether any URL query strings in viewer requests are included in the cache key and automatically included in requests that CloudFront sends to the origin"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].query_strings_config[0].query_string_behavior, null)
}

output "query_strings" {
  description = "Object that contains a list of query string names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].query_strings_config[0].query_strings, null)
}

output "query_string_items" {
  description = "List of query string names"
  value       = try(data.aws_cloudfront_cache_policy.this.parameters_in_cache_key_and_forwarded_to_origin[0].query_strings_config[0].query_strings[0].items, null)
}