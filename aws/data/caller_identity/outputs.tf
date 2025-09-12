output "account_id" {
  description = "AWS Account ID number of the account that owns or contains the calling entity"
  value       = data.aws_caller_identity.this.account_id
}

output "arn" {
  description = "ARN associated with the calling entity"
  value       = data.aws_caller_identity.this.arn
}

output "id" {
  description = "Account ID number of the account that owns or contains the calling entity"
  value       = data.aws_caller_identity.this.id
}

output "user_id" {
  description = "Unique identifier of the calling entity"
  value       = data.aws_caller_identity.this.user_id
}