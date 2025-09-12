output "arn" {
  description = "The ARN of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.arn
}

output "attributes" {
  description = "The attributes of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.attributes
}

output "dns_name" {
  description = "The DNS name of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.dns_name
}


output "enabled" {
  description = "Indicates whether the custom routing accelerator is enabled"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.enabled
}

output "hosted_zone_id" {
  description = "The Global Accelerator Route 53 zone ID"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.hosted_zone_id
}

output "id" {
  description = "The ID of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.id
}

output "ip_address_type" {
  description = "The IP address type of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.ip_address_type
}

output "ip_sets" {
  description = "IP address set associated with the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.ip_sets
}

output "name" {
  description = "The name of the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.name
}

output "tags" {
  description = "A map of tags assigned to the custom routing accelerator"
  value       = data.aws_globalaccelerator_custom_routing_accelerator.this.tags
}