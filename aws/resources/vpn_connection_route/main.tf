resource "aws_vpn_connection_route" "this" {
  destination_cidr_block = var.destination_cidr_block
  vpn_connection_id      = var.vpn_connection_id
}