data "aws_availability_zones" "this" {
  region                 = var.region
  all_availability_zones = var.all_availability_zones
  exclude_names          = var.exclude_names
  exclude_zone_ids       = var.exclude_zone_ids
  state                  = var.state

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