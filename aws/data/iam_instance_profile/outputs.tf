output "arn" {
  description = "ARN"
  value       = data.aws_iam_instance_profile.this.arn
}

output "create_date" {
  description = "String representation of the date the instance profile was created"
  value       = data.aws_iam_instance_profile.this.create_date
}

output "path" {
  description = "Path to the instance profile"
  value       = data.aws_iam_instance_profile.this.path
}

output "role_arn" {
  description = "Role ARN associated with this instance profile"
  value       = data.aws_iam_instance_profile.this.role_arn
}

output "role_id" {
  description = "Role ID associated with this instance profile"
  value       = data.aws_iam_instance_profile.this.role_id
}

output "role_name" {
  description = "Role name associated with this instance profile"
  value       = data.aws_iam_instance_profile.this.role_name
}

output "name" {
  description = "Friendly IAM instance profile name"
  value       = data.aws_iam_instance_profile.this.name
}