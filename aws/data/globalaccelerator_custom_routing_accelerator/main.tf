data "aws_globalaccelerator_custom_routing_accelerator" "this" {
  arn  = var.arn
  name = var.name
}