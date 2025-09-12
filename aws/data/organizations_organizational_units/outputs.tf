output "children" {
  description = "List of child organizational units"
  value       = data.aws_organizations_organizational_units.this.children
}

output "id" {
  description = "Parent identifier of the organizational units"
  value       = data.aws_organizations_organizational_units.this.id
}