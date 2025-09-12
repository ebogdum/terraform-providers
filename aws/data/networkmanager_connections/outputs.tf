output "ids" {
  description = "IDs of the connections"
  value       = data.aws_networkmanager_connections.this.ids
}