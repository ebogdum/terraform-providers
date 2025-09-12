output "arn" {
  description = "Global Network ARN"
  value       = aws_networkmanager_global_network.this.arn
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = aws_networkmanager_global_network.this.tags_all
}

output "id" {
  description = "Global Network ID"
  value       = aws_networkmanager_global_network.this.id
}