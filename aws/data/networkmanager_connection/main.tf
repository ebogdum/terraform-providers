data "aws_networkmanager_connection" "this" {
  global_network_id = var.global_network_id
  connection_id     = var.connection_id
}