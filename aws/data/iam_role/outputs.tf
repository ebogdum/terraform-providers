output "id" {
  description = "Friendly IAM role name to match"
  value       = data.aws_iam_role.this.id
}

output "arn" {
  description = "ARN of the role"
  value       = data.aws_iam_role.this.arn
}

output "assume_role_policy" {
  description = "Policy document associated with the role"
  value       = data.aws_iam_role.this.assume_role_policy
}

output "create_date" {
  description = "Creation date of the role in RFC 3339 format"
  value       = data.aws_iam_role.this.create_date
}

output "description" {
  description = "Description for the role"
  value       = data.aws_iam_role.this.description
}

output "max_session_duration" {
  description = "Maximum session duration"
  value       = data.aws_iam_role.this.max_session_duration
}

output "path" {
  description = "Path to the role"
  value       = data.aws_iam_role.this.path
}

output "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role"
  value       = data.aws_iam_role.this.permissions_boundary
}

output "role_last_used" {
  description = "Contains information about the last time that an IAM role was used"
  value       = data.aws_iam_role.this.role_last_used
}

output "unique_id" {
  description = "Stable and unique string identifying the role"
  value       = data.aws_iam_role.this.unique_id
}

output "tags" {
  description = "Tags attached to the role"
  value       = data.aws_iam_role.this.tags
}