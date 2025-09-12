output "arns" {
  description = "Set of ARNs of instance profiles"
  value       = data.aws_iam_instance_profiles.this.arns
}

output "names" {
  description = "Set of IAM instance profile names"
  value       = data.aws_iam_instance_profiles.this.names
}

output "paths" {
  description = "Set of IAM instance profile paths"
  value       = data.aws_iam_instance_profiles.this.paths
}