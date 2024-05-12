resource "aws_db_subnet_group" "r_aws_db_subnet_group" {
  description = var.description
  id          = var.id
  name        = var.name
  name_prefix = var.name_prefix
  subnet_ids  = var.subnet_ids
  tags        = var.tags
  tags_all    = var.tags_all
}
