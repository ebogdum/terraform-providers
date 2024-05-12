resource "aws_db_parameter_group" "r_aws_db_parameter_group" {
  description = var.description
  family      = var.family
  id          = var.id
  name        = var.name
  name_prefix = var.name_prefix
  tags        = var.tags
  tags_all    = var.tags_all
}
