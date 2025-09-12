output "ids" {
  description = "IDs of the global networks"
  value       = data.aws_networkmanager_global_networks.this.ids
}