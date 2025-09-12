output "accounts" {
  description = "List of child accounts"
  value       = data.aws_organizations_organizational_unit_descendant_accounts.this.accounts
}

output "id" {
  description = "Parent identifier of the organizational units"
  value       = data.aws_organizations_organizational_unit_descendant_accounts.this.id
}