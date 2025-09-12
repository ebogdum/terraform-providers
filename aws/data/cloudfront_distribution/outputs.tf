output "id" {
  description = "Identifier for the distribution. For example: EDFDVBD632BHDS5."
  value       = data.aws_cloudfront_distribution.this.id
}

output "aliases" {
  description = "List that contains information about CNAMEs (alternate domain names), if any, for this distribution."
  value       = data.aws_cloudfront_distribution.this.aliases
}

output "anycast_ip_list_id" {
  description = "ID of the Anycast static IP list that is associated with the distribution, if any."
  value       = data.aws_cloudfront_distribution.this.anycast_ip_list_id
}

output "arn" {
  description = "ARN (Amazon Resource Name) for the distribution. For example: arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5, where 123456789012 is your AWS account ID."
  value       = data.aws_cloudfront_distribution.this.arn
}

output "status" {
  description = "Current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
  value       = data.aws_cloudfront_distribution.this.status
}

output "domain_name" {
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net."
  value       = data.aws_cloudfront_distribution.this.domain_name
}

output "last_modified_time" {
  description = "Date and time the distribution was last modified."
  value       = data.aws_cloudfront_distribution.this.last_modified_time
}

output "in_progress_validation_batches" {
  description = "The number of invalidation batches currently in progress."
  value       = data.aws_cloudfront_distribution.this.in_progress_validation_batches
}

output "etag" {
  description = "Current version of the distribution's information. For example: E2QWRUHAPOMQZL."
  value       = data.aws_cloudfront_distribution.this.etag
}

output "hosted_zone_id" {
  description = "CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
  value       = data.aws_cloudfront_distribution.this.hosted_zone_id
}

output "web_acl_id" {
  description = "AWS WAF web ACL associated with this distribution."
  value       = data.aws_cloudfront_distribution.this.web_acl_id
}