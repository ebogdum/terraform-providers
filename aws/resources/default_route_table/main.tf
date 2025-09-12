resource "aws_default_route_table" "this" {
  default_route_table_id = var.default_route_table_id
  region                 = var.region
  propagating_vgws       = var.propagating_vgws
  tags                   = var.tags

  dynamic "route" {
    for_each = var.route
    content {
      cidr_block                 = route.value.cidr_block
      ipv6_cidr_block            = route.value.ipv6_cidr_block
      destination_prefix_list_id = route.value.destination_prefix_list_id
      core_network_arn           = route.value.core_network_arn
      egress_only_gateway_id     = route.value.egress_only_gateway_id
      gateway_id                 = route.value.gateway_id
      instance_id                = route.value.instance_id
      nat_gateway_id             = route.value.nat_gateway_id
      network_interface_id       = route.value.network_interface_id
      transit_gateway_id         = route.value.transit_gateway_id
      vpc_endpoint_id            = route.value.vpc_endpoint_id
      vpc_peering_connection_id  = route.value.vpc_peering_connection_id
    }
  }
}