resource "aws_load_balancer_listener_policy" "this" {
  region             = var.region
  load_balancer_name = var.load_balancer_name
  load_balancer_port = var.load_balancer_port
  policy_names       = var.policy_names
  triggers           = var.triggers
}