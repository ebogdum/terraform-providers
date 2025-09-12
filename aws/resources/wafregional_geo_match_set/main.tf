resource "aws_wafregional_geo_match_set" "this" {
  region = var.region
  name   = var.name

  dynamic "geo_match_constraint" {
    for_each = var.geo_match_constraint
    content {
      type  = geo_match_constraint.value.type
      value = geo_match_constraint.value.value
    }
  }
}