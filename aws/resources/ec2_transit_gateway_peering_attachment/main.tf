resource "aws_ec2_transit_gateway_peering_attachment" "this" {
  region                  = var.region
  peer_account_id         = var.peer_account_id
  peer_region             = var.peer_region
  peer_transit_gateway_id = var.peer_transit_gateway_id
  transit_gateway_id      = var.transit_gateway_id
  tags                    = var.tags

  dynamic "options" {
    for_each = var.options != null ? [var.options] : []
    content {
      dynamic_routing = options.value.dynamic_routing
    }
  }
}