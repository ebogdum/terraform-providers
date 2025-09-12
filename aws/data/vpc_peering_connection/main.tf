data "aws_vpc_peering_connection" "this" {
  id              = var.id
  status          = var.status
  vpc_id          = var.vpc_id
  owner_id        = var.owner_id
  cidr_block      = var.cidr_block
  peer_vpc_id     = var.peer_vpc_id
  peer_owner_id   = var.peer_owner_id
  peer_cidr_block = var.peer_cidr_block
  tags            = var.tags

  dynamic "filter" {
    for_each = var.filter
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }

  timeouts {
    read = var.read_timeout
  }
}