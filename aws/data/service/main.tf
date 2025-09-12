data "aws_service" "this" {
  dns_name           = var.dns_name
  region             = var.region
  reverse_dns_name   = var.reverse_dns_name
  reverse_dns_prefix = var.reverse_dns_prefix
  service_id         = var.service_id
}