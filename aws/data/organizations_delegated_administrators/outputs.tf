output "delegated_administrators" {
  description = "The list of delegated administrators in your organization"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators
}

output "arn" {
  description = "The ARN of the delegated administrator's account"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].arn
}

output "delegation_enabled_date" {
  description = "The date when the account was made a delegated administrator"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].delegation_enabled_date
}

output "email" {
  description = "The email address that is associated with the delegated administrator's AWS account"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].email
}

output "id" {
  description = "The unique identifier (ID) of the delegated administrator's account"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].id
}

output "joined_method" {
  description = "The method by which the delegated administrator's account joined the organization"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].joined_method
}

output "joined_timestamp" {
  description = "The date when the delegated administrator's account became a part of the organization"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].joined_timestamp
}

output "name" {
  description = "The friendly name of the delegated administrator's account"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].name
}

output "status" {
  description = "The status of the delegated administrator's account in the organization"
  value       = data.aws_organizations_delegated_administrators.this.delegated_administrators[*].status
}