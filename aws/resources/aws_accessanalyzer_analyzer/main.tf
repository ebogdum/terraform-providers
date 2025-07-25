resource "aws_accessanalyzer_analyzer" "aws_accessanalyzer_analyzer" {
  count         = var.create_access_analyzer ? 1 : 0
  analyzer_name = var.analyzer_name
  type          = var.analyzer_type
  tags          = var.analyzer_tags

  dynamic "configuration" {
    for_each = var.analyzer_configuration != null ? [var.analyzer_configuration] : []
    content {
      dynamic "internal_access" {
        for_each = try(configuration.value.internal_access != null, false) ? [configuration.value.internal_access] : []
        content {
          dynamic "analysis_rule" {
            for_each = try(internal_access.value.analysis_rule, [])
            content {
              dynamic "inclusion" {
                for_each = try(analysis_rule.value.inclusion, [])
                content {
                  account_ids   = try(inclusion.value.account_ids, null)
                  resource_arns = try(inclusion.value.resource_arns, null)
                  resource_types = try(inclusion.value.resource_types, null)
                }
              }
            }
          }
        }
      }

      dynamic "unused_access" {
        for_each = try(configuration.value.unused_access != null, false) ? [configuration.value.unused_access] : []
        content {
          unused_access_age = unused_access.value.unused_access_age

          dynamic "analysis_rule" {
            for_each = try(unused_access.value.analysis_rule, [])
            content {
              dynamic "exclusion" {
                for_each = try(analysis_rule.value.exclusion, [])
                content {
                  account_ids   = try(exclusion.value.account_ids, null)
                  resource_tags = try(exclusion.value.resource_tags, null)
                }
              }
            }
          }
        }
      }
    }
  }

  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
    ignore_changes        = []
  }
}