data "aws_lb_hosted_zone_id" "this" {
  region             = var.region
  load_balancer_type = var.load_balancer_type
}