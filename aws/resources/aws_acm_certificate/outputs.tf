output "acm_certificate_arn" {
  description = "ARN of the ACM certificate."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].arn, null)
}

output "acm_certificate_domain_name" {
  description = "Primary domain name for which the ACM certificate is issued."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].domain_name, null)
}

output "acm_certificate_status" {
  description = "Status of the ACM certificate."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].status, null)
}

output "acm_certificate_type" {
  description = "Type of ACM certificate (issued by ACM, imported, or private)."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].type, null)
}

output "acm_certificate_validation_options" {
  description = "A set of domain validation objects used to complete certificate validation. Includes record name, type, and value."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].domain_validation_options, null)
}

output "acm_certificate_not_after" {
  description = "Expiration timestamp of the ACM certificate."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].not_after, null)
}

output "acm_certificate_not_before" {
  description = "Start timestamp of the ACM certificate validity."
  value       = try(aws_acm_certificate.aws_acm_certificate[0].not_before, null)
}
