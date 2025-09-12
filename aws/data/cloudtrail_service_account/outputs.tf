output "service_principal" {
  description = "Service principal for AWS CloudTrail."
  value       = local.cloudtrail_service_principal
}