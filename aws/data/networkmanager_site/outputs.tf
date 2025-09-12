output "arn" {
  description = "ARN of the site"
  value       = data.aws_networkmanager_site.this.arn
}

output "description" {
  description = "Description of the site"
  value       = data.aws_networkmanager_site.this.description
}

output "location" {
  description = "Site location"
  value       = data.aws_networkmanager_site.this.location
}

output "tags" {
  description = "Key-value tags for the Site"
  value       = data.aws_networkmanager_site.this.tags
}

output "global_network_id" {
  description = "ID of the Global Network of the site"
  value       = data.aws_networkmanager_site.this.global_network_id
}

output "site_id" {
  description = "ID of the specific site"
  value       = data.aws_networkmanager_site.this.site_id
}