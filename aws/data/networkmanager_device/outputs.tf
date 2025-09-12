output "device_id" {
  description = "ID of the device."
  value       = data.aws_networkmanager_device.this.device_id
}

output "global_network_id" {
  description = "ID of the global network."
  value       = data.aws_networkmanager_device.this.global_network_id
}

output "arn" {
  description = "ARN of the device."
  value       = data.aws_networkmanager_device.this.arn
}

output "aws_location" {
  description = "AWS location of the device."
  value       = data.aws_networkmanager_device.this.aws_location
}

output "description" {
  description = "Description of the device."
  value       = data.aws_networkmanager_device.this.description
}

output "location" {
  description = "Location of the device."
  value       = data.aws_networkmanager_device.this.location
}

output "model" {
  description = "Model of device."
  value       = data.aws_networkmanager_device.this.model
}

output "serial_number" {
  description = "Serial number of the device."
  value       = data.aws_networkmanager_device.this.serial_number
}

output "site_id" {
  description = "ID of the site."
  value       = data.aws_networkmanager_device.this.site_id
}

output "tags" {
  description = "Key-value tags for the device."
  value       = data.aws_networkmanager_device.this.tags
}

output "type" {
  description = "Type of device."
  value       = data.aws_networkmanager_device.this.type
}

output "vendor" {
  description = "Vendor of the device."
  value       = data.aws_networkmanager_device.this.vendor
}