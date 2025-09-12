data "aws_nat_gateway" "this" {
  id        = var.id
  subnet_id = var.subnet_id
  vpc_id    = var.vpc_id
  state     = var.state
  tags      = var.tags

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