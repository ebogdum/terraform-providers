resource "aws_guardduty_organization_admin_account" "this" {
  admin_account_id = var.admin_account_id
  region           = var.region
}