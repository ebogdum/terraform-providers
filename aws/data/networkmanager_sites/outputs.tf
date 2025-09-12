output "ids" {
  description = "IDs of the sites"
  value       = data.aws_networkmanager_sites.this.ids
}

output "global_network_id" {
  description = "ID of the Global Network of the sites"
  value       = data.aws_networkmanager_sites.this.global_network_id
}

output "tags" {
  description = "Tags used to restrict the list of sites"
  value       = data.aws_networkmanager_sites.this.tags
}