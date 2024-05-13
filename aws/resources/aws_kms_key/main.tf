resource "aws_kms_key" "r_aws_kms_key" {
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  custom_key_store_id                = var.custom_key_store_id
  customer_master_key_spec           = var.customer_master_key_spec
  deletion_window_in_days            = var.deletion_window_in_days
  description                        = var.description
  enable_key_rotation                = var.enable_key_rotation
  is_enabled                         = var.is_enabled
  key_usage                          = var.key_usage
  multi_region                       = var.multi_region
  policy                             = var.policy
  tags                               = var.tags
  tags_all                           = var.tags_all
  xks_key_id                         = var.xks_key_id
}
