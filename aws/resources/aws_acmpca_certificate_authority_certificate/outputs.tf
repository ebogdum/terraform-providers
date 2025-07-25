output "certificate_authority_arns" {
  description = "List of ARNs for the created ACM Private Certificate Authorities."
  value       = [for ca in aws_acmpca_certificate_authority.aws_acmpca_certificate_authority : ca.arn]
  condition   = var.create_certificate_authorities
}

output "acmpca_certificate_ids" {
  description = "Map of created ACM PCA certificate names to IDs."
  value       = { for k, v in aws_acmpca_certificate.aws_acmpca_certificate : k => v.id }
  condition   = var.create_certificates
}

output "certificate_authority_certificate_ids" {
  description = "Map of certificate authority certificate names to resource IDs."
  value       = { for k, v in aws_acmpca_certificate_authority_certificate.aws_acmpca_certificate_authority_certificate : k => v.id }
  condition   = var.create_certificate_auth_certificates
}