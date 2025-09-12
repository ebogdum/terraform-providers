output "arn" {
  description = "ARN of the link"
  value       = data.aws_networkmanager_link.this.arn
}

output "bandwidth" {
  description = "Upload speed and download speed of the link"
  value       = data.aws_networkmanager_link.this.bandwidth
}

output "description" {
  description = "Description of the link"
  value       = data.aws_networkmanager_link.this.description
}

output "provider_name" {
  description = "Provider of the link"
  value       = data.aws_networkmanager_link.this.provider_name
}

output "site_id" {
  description = "ID of the site"
  value       = data.aws_networkmanager_link.this.site_id
}

output "tags" {
  description = "Key-value tags for the link"
  value       = data.aws_networkmanager_link.this.tags
}

output "type" {
  description = "Type of the link"
  value       = data.aws_networkmanager_link.this.type
}

output "global_network_id" {
  description = "ID of the Global Network of the link"
  value       = data.aws_networkmanager_link.this.global_network_id
}

output "link_id" {
  description = "ID of the specific link"
  value       = data.aws_networkmanager_link.this.link_id
}