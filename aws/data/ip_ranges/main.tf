data "aws_ip_ranges" "this" {
  regions  = var.regions
  services = var.services
  url      = var.url
}