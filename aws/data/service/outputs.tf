output "dns_name" {
  description = "DNS name of the service"
  value       = data.aws_service.this.dns_name
}

output "partition" {
  description = "Partition corresponding to the Region"
  value       = data.aws_service.this.partition
}

output "region" {
  description = "Region of the service"
  value       = data.aws_service.this.region
}

output "reverse_dns_name" {
  description = "Reverse DNS name of the service"
  value       = data.aws_service.this.reverse_dns_name
}

output "reverse_dns_prefix" {
  description = "Prefix of the service"
  value       = data.aws_service.this.reverse_dns_prefix
}

output "service_id" {
  description = "Service endpoint ID"
  value       = data.aws_service.this.service_id
}

output "supported" {
  description = "Whether the service is supported in the region's partition. New services may not be listed immediately as supported."
  value       = data.aws_service.this.supported
}