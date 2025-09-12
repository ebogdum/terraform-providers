resource "aws_db_option_group" "this" {
  region                   = var.region
  name                     = var.name
  name_prefix              = var.name_prefix
  option_group_description = var.option_group_description
  engine_name              = var.engine_name
  major_engine_version     = var.major_engine_version
  skip_destroy             = var.skip_destroy
  tags                     = var.tags

  dynamic "option" {
    for_each = var.option
    content {
      option_name                    = option.value.option_name
      port                           = option.value.port
      version                        = option.value.version
      db_security_group_memberships  = option.value.db_security_group_memberships
      vpc_security_group_memberships = option.value.vpc_security_group_memberships

      dynamic "option_settings" {
        for_each = option.value.option_settings != null ? option.value.option_settings : []
        content {
          name  = option_settings.value.name
          value = option_settings.value.value
        }
      }
    }
  }

  timeouts {
    delete = var.timeouts_delete
  }
}