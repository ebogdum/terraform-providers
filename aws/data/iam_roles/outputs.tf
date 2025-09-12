output "arns" {
  description = "Set of ARNs of the matched IAM roles."
  value       = data.aws_iam_roles.this.arns
}

output "names" {
  description = "Set of Names of the matched IAM roles."
  value       = data.aws_iam_roles.this.names
}