resource "aws_accessanalyzer_archive_rule" "aws_accessanalyzer_archive_rule" {
  count         = var.create_accessanalyzer_archive_rule ? 1 : 0
  analyzer_name = var.analyzer_name
  rule_name     = var.rule_name

  dynamic "filter" {
    for_each = var.filters
    content {
      criteria = filter.value.criteria

      dynamic "contains" {
        for_each = filter.value.contains != null ? [filter.value.contains] : []
        content {
          contains = contains.value
        }
      }

      dynamic "eq" {
        for_each = filter.value.eq != null ? [filter.value.eq] : []
        content {
          eq = eq.value
        }
      }

      dynamic "exists" {
        for_each = filter.value.exists != null ? [filter.value.exists] : []
        content {
          exists = exists.value
        }
      }

      dynamic "neq" {
        for_each = filter.value.neq != null ? [filter.value.neq] : []
        content {
          neq = neq.value
        }
      }
    }
  }

  lifecycle {
    prevent_destroy      = true
    create_before_destroy = true
  }
}