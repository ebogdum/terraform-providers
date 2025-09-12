data "aws_regions" "this" {
  all_regions = var.all_regions

  dynamic "filter" {
    for_each = var.filter
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}