output "arn" {
  description = "Full ARN of the Global Accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.arn
}

output "name" {
  description = "Unique name of the Global Accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.name
}

output "dns_name" {
  description = "DNS name of the accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.dns_name
}

output "dual_stack_dns_name" {
  description = "DNS name that can resolve to both IPv4 and IPv6 addresses"
  value       = data.aws_globalaccelerator_accelerator.this.dual_stack_dns_name
}

output "enabled" {
  description = "Whether the accelerator is enabled"
  value       = data.aws_globalaccelerator_accelerator.this.enabled
}

output "hosted_zone_id" {
  description = "Route 53 hosted zone ID associated with the accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.hosted_zone_id
}

output "ip_address_type" {
  description = "IP address type of the accelerator (IPV4 or DUAL_STACK)"
  value       = data.aws_globalaccelerator_accelerator.this.ip_address_type
}

output "ip_sets" {
  description = "IP address sets associated with the accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.ip_sets
}

output "tags" {
  description = "Resource tags"
  value       = data.aws_globalaccelerator_accelerator.this.tags
}

output "attributes" {
  description = "Accelerator attributes"
  value       = data.aws_globalaccelerator_accelerator.this.attributes
}

output "id" {
  description = "ID of the accelerator"
  value       = data.aws_globalaccelerator_accelerator.this.id
}