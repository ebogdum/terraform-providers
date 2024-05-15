resource "aws_db_parameter_group" "r_aws_db_parameter_group" {
  description = var.description
  family      = var.family
  name        = var.name
  name_prefix = var.name_prefix
  tags        = var.tags
  tags_all    = var.tags_all

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value[ "name" ]
      value        = parameter.value[ "value" ]
      apply_method = parameter.value[ "apply_method" ]
    }
  }

}
