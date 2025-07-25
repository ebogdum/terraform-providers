output "certificate_authority_arn" {
  description = "ARN of the created or referenced Certificate Authority."
  value       = var.create_certificate_authority ? aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].arn : var.external_certificate_authority_arn
}

output "acmpca_permission_policy" {
  description = "IAM policy associated with the ACM PCA permission."
  value       = try(aws_acmpca_permission.aws_acmpca_permission[0].policy, null)
}

output "certificate_authority_id" {
  description = "Certificate Authority ID (UUID)."
  value       = try(aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].id, null)
}