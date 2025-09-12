output "region" {
  description = "Full name of the region"
  value       = data.aws_region.this.region
}

output "endpoint" {
  description = "EC2 endpoint of the region"
  value       = data.aws_region.this.endpoint
}

output "name" {
  description = "Full name of the region (deprecated)"
  value       = data.aws_region.this.name
}

output "description" {
  description = "Region's description in this format: Location (Region name)"
  value       = data.aws_region.this.description
}