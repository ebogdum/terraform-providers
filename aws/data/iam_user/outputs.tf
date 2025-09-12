output "arn" {
  description = "ARN assigned by AWS for this user"
  value       = data.aws_iam_user.this.arn
}

output "id" {
  description = "Unique ID assigned by AWS for this user"
  value       = data.aws_iam_user.this.id
}

output "path" {
  description = "Path in which this user was created"
  value       = data.aws_iam_user.this.path
}

output "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  value       = data.aws_iam_user.this.permissions_boundary
}

output "user_id" {
  description = "Unique ID assigned by AWS for this user"
  value       = data.aws_iam_user.this.user_id
}

output "user_name" {
  description = "Name associated to this User"
  value       = data.aws_iam_user.this.user_name
}

output "tags" {
  description = "Map of key-value pairs associated with the user"
  value       = data.aws_iam_user.this.tags
}