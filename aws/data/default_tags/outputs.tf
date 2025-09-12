output "tags" {
  description = "Key-value mapping of provider default tags."
  value       = data.aws_default_tags.this.tags
}