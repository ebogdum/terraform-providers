output "accounts" {
  description = "List of child accounts, which have the following attributes: arn, email, id, name, status"
  value       = data.aws_organizations_organizational_unit_child_accounts.this.accounts
}

output "id" {
  description = "Parent identifier of the organizational units"
  value       = data.aws_organizations_organizational_unit_child_accounts.this.id
}