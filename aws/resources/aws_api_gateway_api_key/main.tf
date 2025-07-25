resource "aws_api_gateway_api_key" "aws_api_gateway_api_key" {
  count       = var.create_api_gateway_api_key ? length(var.api_keys) : 0
  name        = var.api_keys[count.index].name
  customer_id = var.api_keys[count.index].customer_id
  description = var.api_keys[count.index].description
  enabled     = var.api_keys[count.index].enabled
  value       = var.api_keys[count.index].value
  tags        = var.api_keys[count.index].tags

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [value]
  }
}
