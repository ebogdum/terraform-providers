resource "aws_quicksight_group" "this" {
  aws_account_id = var.aws_account_id
  description    = var.description
  group_name     = var.group_name
  namespace      = var.namespace
  region         = var.region
}