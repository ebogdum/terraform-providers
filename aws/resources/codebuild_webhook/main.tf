resource "aws_codebuild_webhook" "this" {
  region          = var.region
  project_name    = var.project_name
  build_type      = var.build_type
  manual_creation = var.manual_creation
  branch_filter   = var.branch_filter

  dynamic "filter_group" {
    for_each = var.filter_group
    content {
      dynamic "filter" {
        for_each = filter_group.value.filter
        content {
          type                    = filter.value.type
          pattern                 = filter.value.pattern
          exclude_matched_pattern = filter.value.exclude_matched_pattern
        }
      }
    }
  }

  dynamic "scope_configuration" {
    for_each = var.scope_configuration != null ? [var.scope_configuration] : []
    content {
      name   = scope_configuration.value.name
      scope  = scope_configuration.value.scope
      domain = scope_configuration.value.domain
    }
  }
}