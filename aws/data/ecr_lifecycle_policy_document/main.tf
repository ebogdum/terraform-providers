data "aws_ecr_lifecycle_policy_document" "this" {
  dynamic "rule" {
    for_each = var.rules
    content {
      priority    = rule.value.priority
      description = rule.value.description

      dynamic "action" {
        for_each = rule.value.action != null ? [rule.value.action] : []
        content {
          type = action.value.type
        }
      }

      selection {
        tag_status       = rule.value.selection.tag_status
        tag_pattern_list = rule.value.selection.tag_pattern_list
        tag_prefix_list  = rule.value.selection.tag_prefix_list
        count_type       = rule.value.selection.count_type
        count_unit       = rule.value.selection.count_unit
        count_number     = rule.value.selection.count_number
      }
    }
  }
}