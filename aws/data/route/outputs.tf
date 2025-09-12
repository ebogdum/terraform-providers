output "route_table_id" {
  description = "ID of the specific Route Table containing the Route entry"
  value       = data.aws_route.this.route_table_id
}

output "carrier_gateway_id" {
  description = "EC2 Carrier Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.carrier_gateway_id
}

output "core_network_arn" {
  description = "Core network ARN of the Route belonging to the Route Table"
  value       = data.aws_route.this.core_network_arn
}

output "destination_cidr_block" {
  description = "CIDR block of the Route belonging to the Route Table"
  value       = data.aws_route.this.destination_cidr_block
}

output "destination_ipv6_cidr_block" {
  description = "IPv6 CIDR block of the Route belonging to the Route Table"
  value       = data.aws_route.this.destination_ipv6_cidr_block
}

output "destination_prefix_list_id" {
  description = "ID of a managed prefix list destination of the Route belonging to the Route Table"
  value       = data.aws_route.this.destination_prefix_list_id
}

output "egress_only_gateway_id" {
  description = "Egress Only Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.egress_only_gateway_id
}

output "gateway_id" {
  description = "Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.gateway_id
}

output "instance_id" {
  description = "Instance ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.instance_id
}

output "local_gateway_id" {
  description = "Local Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.local_gateway_id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.nat_gateway_id
}

output "network_interface_id" {
  description = "Network Interface ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.network_interface_id
}

output "transit_gateway_id" {
  description = "EC2 Transit Gateway ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.transit_gateway_id
}

output "vpc_peering_connection_id" {
  description = "VPC Peering Connection ID of the Route belonging to the Route Table"
  value       = data.aws_route.this.vpc_peering_connection_id
}