output "arn" {
  description = "ARN of the connection"
  value       = data.aws_networkmanager_connection.this.arn
}

output "connected_device_id" {
  description = "ID of the second device in the connection"
  value       = data.aws_networkmanager_connection.this.connected_device_id
}

output "connected_link_id" {
  description = "ID of the link for the second device"
  value       = data.aws_networkmanager_connection.this.connected_link_id
}

output "description" {
  description = "Description of the connection"
  value       = data.aws_networkmanager_connection.this.description
}

output "device_id" {
  description = "ID of the first device in the connection"
  value       = data.aws_networkmanager_connection.this.device_id
}

output "link_id" {
  description = "ID of the link for the first device"
  value       = data.aws_networkmanager_connection.this.link_id
}

output "tags" {
  description = "Key-value tags for the connection"
  value       = data.aws_networkmanager_connection.this.tags
}

output "global_network_id" {
  description = "ID of the Global Network of the connection"
  value       = data.aws_networkmanager_connection.this.global_network_id
}

output "connection_id" {
  description = "ID of the specific connection"
  value       = data.aws_networkmanager_connection.this.connection_id
}