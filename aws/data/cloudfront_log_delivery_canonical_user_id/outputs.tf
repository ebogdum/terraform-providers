output "id" {
  description = "Canonical user ID for the AWS awslogsdelivery account in the Region."
  value       = data.aws_cloudfront_log_delivery_canonical_user_id.this.id
}