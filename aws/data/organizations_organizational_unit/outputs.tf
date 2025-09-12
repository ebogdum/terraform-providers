output "arn" {
  description = "ARN of the organizational unit"
  value       = data.aws_organizations_organizational_unit.this.arn
}

output "id" {
  description = "ID of the organizational unit"
  value       = data.aws_organizations_organizational_unit.this.id
}