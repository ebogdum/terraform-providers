output "id" {
  description = "ID of the VPC Peering Connection"
  value       = data.aws_vpc_peering_connection.this.id
}

output "status" {
  description = "Status of the VPC Peering Connection"
  value       = data.aws_vpc_peering_connection.this.status
}

output "vpc_id" {
  description = "ID of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.vpc_id
}

output "owner_id" {
  description = "AWS account ID of the owner of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.owner_id
}

output "cidr_block" {
  description = "Primary CIDR block of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.cidr_block
}

output "peer_vpc_id" {
  description = "ID of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_vpc_id
}

output "peer_owner_id" {
  description = "AWS account ID of the owner of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_owner_id
}

output "peer_cidr_block" {
  description = "Primary CIDR block of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_cidr_block
}

output "tags" {
  description = "Map of tags assigned to the VPC Peering Connection"
  value       = data.aws_vpc_peering_connection.this.tags
}

output "accepter" {
  description = "Configuration block that describes VPC Peering Connection options set for the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.accepter
}

output "cidr_block_set" {
  description = "List of objects with IPv4 CIDR blocks of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.cidr_block_set
}

output "ipv6_cidr_block_set" {
  description = "List of objects with IPv6 CIDR blocks of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.ipv6_cidr_block_set
}

output "peer_cidr_block_set" {
  description = "List of objects with IPv4 CIDR blocks of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_cidr_block_set
}

output "peer_ipv6_cidr_block_set" {
  description = "List of objects with IPv6 CIDR blocks of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_ipv6_cidr_block_set
}

output "peer_region" {
  description = "Region of the accepter VPC"
  value       = data.aws_vpc_peering_connection.this.peer_region
}

output "region" {
  description = "Region of the requester VPC (deprecated, use requester_region instead)"
  value       = data.aws_vpc_peering_connection.this.region
}

output "requester" {
  description = "Configuration block that describes VPC Peering Connection options set for the requester VPC"
  value       = data.aws_vpc_peering_connection.this.requester
}

output "requester_region" {
  description = "Region of the requester VPC"
  value       = data.aws_vpc_peering_connection.this.requester_region
}