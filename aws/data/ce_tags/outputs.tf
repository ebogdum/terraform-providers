output "id" {
  description = "Unique ID of the tag"
  value       = data.aws_ce_tags.this.id
}

output "tags" {
  description = "Tags that match your request"
  value       = data.aws_ce_tags.this.tags
}