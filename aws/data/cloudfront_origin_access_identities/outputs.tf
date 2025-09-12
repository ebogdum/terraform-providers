output "iam_arns" {
  description = "Set of ARNs of the matched origin access identities"
  value       = data.aws_cloudfront_origin_access_identities.this.iam_arns
}

output "ids" {
  description = "Set of ids of the matched origin access identities"
  value       = data.aws_cloudfront_origin_access_identities.this.ids
}

output "s3_canonical_user_ids" {
  description = "Set of S3 canonical user IDs of the matched origin access identities"
  value       = data.aws_cloudfront_origin_access_identities.this.s3_canonical_user_ids
}