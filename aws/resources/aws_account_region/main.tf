resource "aws_account_region" "aws_account_region" {
  for_each    = var.enable_account_region ? { for region in var.account_regions : region.region_name => region } : {}
  region_name = each.value.region_name
  enabled     = each.value.enabled
  account_id  = each.value.account_id

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [enabled]
  }

  timeouts {
    create = "60m"
    update = "60m"
  }
}