output "id" {
  description = "ID of the AWS billing service account"
  value       = data.aws_billing_service_account.this.id
}

output "arn" {
  description = "ARN of the AWS billing service account"
  value       = data.aws_billing_service_account.this.arn
}