data "aws_organizations_organization" "aws_organizations_organization" {
  count = var.create_ami_launch_permission && var.enable_organization_access ? 1 : 0
}

resource "aws_ami_launch_permission" "aws_ami_launch_permission" {
  for_each = var.create_ami_launch_permission ? { for i, p in var.ami_launch_permissions : i => p } : {}

  image_id = each.value.image_id

  account_id              = lookup(each.value, "account_id", null)
  group                   = lookup(each.value, "group", null)
  organization_arn        = lookup(each.value, "organization_arn", (var.enable_organization_access && length(data.aws_organizations_organization.aws_organizations_organization) > 0) ? data.aws_organizations_organization.aws_organizations_organization[0].arn : null)
  organizational_unit_arn = lookup(each.value, "organizational_unit_arn", null)

  lifecycle {
    prevent_destroy      = true
    ignore_changes       = [account_id, group, organization_arn, organizational_unit_arn]
    create_before_destroy = true
  }
}