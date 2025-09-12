output "arns" {
  description = "Set of ARNs of the matched IAM users."
  value       = data.aws_iam_users.this.arns
}

output "names" {
  description = "Set of Names of the matched IAM users."
  value       = data.aws_iam_users.this.names
}