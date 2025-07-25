output "acmpca_policy_resource_arn" {
  description = "The ARN of the ACM PCA resource to which the policy was attached."
  value       = var.certificate_authority_arn
}