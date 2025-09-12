data "aws_globalaccelerator_accelerator" "this" {
  arn  = var.arn
  name = var.name
}