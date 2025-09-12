output "global_network_id" {
  description = "ID of the Global Network of the devices to retrieve"
  value       = data.aws_networkmanager_devices.this.global_network_id
}

output "site_id" {
  description = "ID of the site of the devices to retrieve"
  value       = data.aws_networkmanager_devices.this.site_id
}

output "tags" {
  description = "Restricts the list to the devices with these tags"
  value       = data.aws_networkmanager_devices.this.tags
}

output "ids" {
  description = "IDs of the devices"
  value       = data.aws_networkmanager_devices.this.ids
}