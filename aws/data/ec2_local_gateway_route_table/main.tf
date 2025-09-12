data "aws_ec2_local_gateway_route_table" "this" {
  local_gateway_route_table_id = var.local_gateway_route_table_id
  local_gateway_id             = var.local_gateway_id
  outpost_arn                  = var.outpost_arn
  state                        = var.state
  tags                         = var.tags

  dynamic "filter" {
    for_each = var.filter
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }

  timeouts {
    read = var.timeouts_read
  }
}