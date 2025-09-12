output "amazon_side_asn" {
  description = "ASN on the Amazon side of the connection"
  value       = data.aws_dx_gateway.this.amazon_side_asn
}

output "arn" {
  description = "ARN of the gateway"
  value       = data.aws_dx_gateway.this.arn
}

output "id" {
  description = "ID of the gateway"
  value       = data.aws_dx_gateway.this.id
}

output "name" {
  description = "Name of the gateway"
  value       = data.aws_dx_gateway.this.name
}

output "owner_account_id" {
  description = "AWS Account ID of the gateway"
  value       = data.aws_dx_gateway.this.owner_account_id
}