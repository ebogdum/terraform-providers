output "arn" {
  description = "The origin access identity ARN"
  value       = data.aws_cloudfront_origin_access_identity.this.arn
}

output "caller_reference" {
  description = "Internal value used by CloudFront to allow future updates to the origin access identity"
  value       = data.aws_cloudfront_origin_access_identity.this.caller_reference
}

output "cloudfront_access_identity_path" {
  description = "A shortcut to the full path for the origin access identity to use in CloudFront"
  value       = data.aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
}

output "comment" {
  description = "An optional comment for the origin access identity"
  value       = data.aws_cloudfront_origin_access_identity.this.comment
}

output "etag" {
  description = "Current version of the origin access identity's information"
  value       = data.aws_cloudfront_origin_access_identity.this.etag
}

output "iam_arn" {
  description = "Pre-generated ARN for use in S3 bucket policies"
  value       = data.aws_cloudfront_origin_access_identity.this.iam_arn
}

output "s3_canonical_user_id" {
  description = "The Amazon S3 canonical user ID for the origin access identity"
  value       = data.aws_cloudfront_origin_access_identity.this.s3_canonical_user_id
}

output "id" {
  description = "The identifier for the origin access identity"
  value       = data.aws_cloudfront_origin_access_identity.this.id
}