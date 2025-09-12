data "aws_organizations_policies_for_target" "this" {
  target_id = var.target_id
  filter    = var.filter
}