output "json" {
  description = "The ECR lifecycle policy document serialized as a standard JSON policy document"
  value       = data.aws_ecr_lifecycle_policy_document.this.json
}