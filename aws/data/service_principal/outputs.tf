output "id" {
  description = "Identifier of the current Service Principal (compound of service, Region and suffix)"
  value       = data.aws_service_principal.this.id
}

output "name" {
  description = "Service Principal Name"
  value       = data.aws_service_principal.this.name
}

output "service" {
  description = "Service used for SPN generation"
  value       = var.service_name
}

output "suffix" {
  description = "Suffix of the SPN"
  value       = data.aws_service_principal.this.suffix
}