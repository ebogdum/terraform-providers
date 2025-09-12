data "aws_ec2_instance_type_offering" "this" {
  region                   = var.region
  location_type            = var.location_type
  preferred_instance_types = var.preferred_instance_types

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