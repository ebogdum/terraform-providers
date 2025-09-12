output "account_alias" {
  description = "Alias associated with the AWS account"
  value       = data.aws_iam_account_alias.this.account_alias
}

output "id" {
  description = "Alias associated with the AWS account"
  value       = data.aws_iam_account_alias.this.id
}