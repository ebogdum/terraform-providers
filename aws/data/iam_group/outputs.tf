output "arn" {
  description = "Group ARN"
  value       = data.aws_iam_group.this.arn
}

output "group_id" {
  description = "Stable and unique string identifying the group"
  value       = data.aws_iam_group.this.group_id
}

output "id" {
  description = "Stable and unique string identifying the group"
  value       = data.aws_iam_group.this.id
}

output "path" {
  description = "Path to the group"
  value       = data.aws_iam_group.this.path
}

output "users" {
  description = "List of objects containing group member information"
  value       = data.aws_iam_group.this.users
}