data "aws_servicequotas_templates" "this" {
  aws_region = var.aws_region
  region     = var.region
}