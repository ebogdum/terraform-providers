output "id" {
  description = "Identifier of the current partition (e.g., aws in AWS Commercial, aws-cn in AWS China)."
  value       = data.aws_regions.this.id
}

output "names" {
  description = "Names of regions that meets the criteria."
  value       = data.aws_regions.this.names
}