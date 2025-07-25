output "certificate_authority_arn" {
  description = "ARN of the ACM PCA certificate authority."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].arn
}

output "certificate_signing_request" {
  description = "Base64 PEM-encoded certificate signing request (CSR) for your private CA. Used to get signed certificate externally."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].certificate_signing_request
}

output "certificate" {
  description = "Base64-encoded CA certificate. Present only after CA certificate is imported."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].certificate
  sensitive   = true
}

output "certificate_chain" {
  description = "Base64-encoded certificate chain obtained after importing CA certificate. Useful for trust configuration."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].certificate_chain
  sensitive   = true
}

output "certificate_serial" {
  description = "Serial number of the imported certificate authority certificate."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].serial
}

output "tags_all" {
  description = "All tags assigned to the certificate authority, including inherited tags."
  value       = aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].tags_all
}