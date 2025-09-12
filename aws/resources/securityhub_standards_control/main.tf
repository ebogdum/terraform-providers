resource "aws_securityhub_standards_control" "this" {
  region                = var.region
  standards_control_arn = var.standards_control_arn
  control_status        = var.control_status
  disabled_reason       = var.disabled_reason
}