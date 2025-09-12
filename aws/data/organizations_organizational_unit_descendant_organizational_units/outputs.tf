output "children" {
  description = "List of child organizational units, which have the following attributes: arn (ARN of the organizational unit), name (Name of the organizational unit), id (ID of the organizational unit)"
  value       = data.aws_organizations_organizational_unit_descendant_organizational_units.this.children
}

output "id" {
  description = "Parent identifier of the organizational units."
  value       = data.aws_organizations_organizational_unit_descendant_organizational_units.this.id
}