data "aws_networkmanager_connections" "this" {
  device_id         = var.device_id
  global_network_id = var.global_network_id
  tags              = var.tags
}