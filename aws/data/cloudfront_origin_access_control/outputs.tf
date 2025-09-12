output "id" {
  description = "The identifier for the origin access control settings."
  value       = data.aws_cloudfront_origin_access_control.this.id
}

output "arn" {
  description = "The origin access control ARN."
  value       = data.aws_cloudfront_origin_access_control.this.arn
}

output "description" {
  description = "A description of the origin access control."
  value       = data.aws_cloudfront_origin_access_control.this.description
}

output "etag" {
  description = "Current version of the origin access control's information."
  value       = data.aws_cloudfront_origin_access_control.this.etag
}

output "name" {
  description = "A name to identify the origin access control."
  value       = data.aws_cloudfront_origin_access_control.this.name
}

output "origin_access_control_origin_type" {
  description = "The type of origin that this origin access control is for."
  value       = data.aws_cloudfront_origin_access_control.this.origin_access_control_origin_type
}

output "signing_behavior" {
  description = "Specifies which requests CloudFront signs."
  value       = data.aws_cloudfront_origin_access_control.this.signing_behavior
}

output "signing_protocol" {
  description = "The signing protocol of the origin access control, which determines how CloudFront signs (authenticates) requests."
  value       = data.aws_cloudfront_origin_access_control.this.signing_protocol
}