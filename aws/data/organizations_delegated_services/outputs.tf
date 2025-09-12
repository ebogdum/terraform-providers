output "delegated_services" {
  description = "Services for which the account is a delegated administrator"
  value       = data.aws_organizations_delegated_services.this.delegated_services
}