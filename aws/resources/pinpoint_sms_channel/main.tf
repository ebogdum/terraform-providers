resource "aws_pinpoint_sms_channel" "this" {
  region         = var.region
  application_id = var.application_id
  enabled        = var.enabled
  sender_id      = var.sender_id
  short_code     = var.short_code
}