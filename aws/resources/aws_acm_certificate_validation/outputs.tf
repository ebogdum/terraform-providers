output "certificate_validation_arn" {
  description = "The ARN of the successfully validated ACM certificate."
  value       = aws_acm_certificate_validation.aws_acm_certificate_validation[0].certificate_arn
  condition   = var.create_certificate_validation
}

output "certificate_domain_name" {
  description = "The main domain name for which the ACM certificate was issued."
  value       = aws_acm_certificate.aws_acm_certificate.domain_name
}

output "certificate_id" {
  description = "The ID (issue time) of the validated ACM certificate."
  value       = aws_acm_certificate_validation.aws_acm_certificate_validation[0].id
  condition   = var.create_certificate_validation
}