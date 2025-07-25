resource "aws_accessanalyzer_analyzer" "aws_accessanalyzer_analyzer" {
  count         = var.create_access_analyzer ? 1 : 0
  analyzer_name = var.analyzer_name
  type          = var.analyzer_type
  tags          = var.analyzer_tags

  dynamic "configuration" {
    for_each = var.analyzer_configuration != null ? [var.analyzer_configuration] : []
    content {
      dynamic "internal_access" {
        for_each = configuration.value.internal_access != null ? [configuration.value.internal_access] : []
        content {
          dynamic "analysis_rule" {
            for_each = internal_access.value.analysis_rule != null ? internal_access.value.analysis_rule : []
            content {
              dynamic "inclusion" {
                for_each = analysis_rule.value.inclusion != null ? [analysis_rule.value.inclusion] : []
                content {
                  account_ids   = lookup(inclusion.value, "account_ids", null)
                  resource_arns = lookup(inclusion.value, "resource_arns", null)
                  resource_types = lookup(inclusion.value, "resource_types", null)
                }
              }
            }
          }
        }
      }

      dynamic "unused_access" {
        for_each = configuration.value.unused_access != null ? [configuration.value.unused_access] : []
        content {
          unused_access_age = unused_access.value.unused_access_age

          dynamic "analysis_rule" {
            for_each = unused_access.value.analysis_rule != null ? unused_access.value.analysis_rule : []
            content {
              dynamic "exclusion" {
                for_each = analysis_rule.value.exclusion != null ? analysis_rule.value.exclusion : []
                content {
                  account_ids   = lookup(exclusion.value, "account_ids", null)
                  resource_tags = lookup(exclusion.value, "resource_tags", null)
                }
              }
            }
          }
        }
      }
    }
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes  = [tags]
  }
}