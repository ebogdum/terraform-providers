output "ids" {
  description = "IDs of the links"
  value       = data.aws_networkmanager_links.this.ids
}

output "global_network_id" {
  description = "ID of the Global Network of the links to retrieve"
  value       = data.aws_networkmanager_links.this.global_network_id
}

output "provider_name" {
  description = "Link provider to retrieve"
  value       = data.aws_networkmanager_links.this.provider_name
}

output "site_id" {
  description = "ID of the site of the links to retrieve"
  value       = data.aws_networkmanager_links.this.site_id
}

output "tags" {
  description = "Restricts the list to the links with these tags"
  value       = data.aws_networkmanager_links.this.tags
}

output "type" {
  description = "Link type to retrieve"
  value       = data.aws_networkmanager_links.this.type
}