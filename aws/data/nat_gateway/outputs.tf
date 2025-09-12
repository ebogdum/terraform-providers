output "id" {
  description = "ID of the specific NAT Gateway"
  value       = data.aws_nat_gateway.this.id
}

output "subnet_id" {
  description = "ID of subnet that the NAT Gateway resides in"
  value       = data.aws_nat_gateway.this.subnet_id
}

output "vpc_id" {
  description = "ID of the VPC that the NAT Gateway resides in"
  value       = data.aws_nat_gateway.this.vpc_id
}

output "state" {
  description = "State of the NAT Gateway"
  value       = data.aws_nat_gateway.this.state
}

output "tags" {
  description = "Map of tags for the NAT Gateway"
  value       = data.aws_nat_gateway.this.tags
}

output "allocation_id" {
  description = "ID of the EIP allocated to the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.allocation_id
}

output "association_id" {
  description = "The association ID of the Elastic IP address that's associated with the NAT Gateway"
  value       = data.aws_nat_gateway.this.association_id
}

output "connectivity_type" {
  description = "Connectivity type of the NAT Gateway"
  value       = data.aws_nat_gateway.this.connectivity_type
}

output "network_interface_id" {
  description = "The ID of the ENI allocated to the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.network_interface_id
}

output "private_ip" {
  description = "Private IP address of the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.private_ip
}

output "public_ip" {
  description = "Public IP (EIP) address of the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.public_ip
}

output "secondary_allocation_ids" {
  description = "Secondary allocation EIP IDs for the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.secondary_allocation_ids
}

output "secondary_private_ip_address_count" {
  description = "The number of secondary private IPv4 addresses assigned to the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.secondary_private_ip_address_count
}

output "secondary_private_ip_addresses" {
  description = "Secondary private IPv4 addresses assigned to the selected NAT Gateway"
  value       = data.aws_nat_gateway.this.secondary_private_ip_addresses
}