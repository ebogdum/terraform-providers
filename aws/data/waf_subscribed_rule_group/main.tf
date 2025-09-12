locals {
  validation_check = var.name != null || var.metric_name != null ? true : tobool("At least one of 'name' or 'metric_name' must be configured.")
}

data "aws_waf_subscribed_rule_group" "this" {
  name        = var.name
  metric_name = var.metric_name
}