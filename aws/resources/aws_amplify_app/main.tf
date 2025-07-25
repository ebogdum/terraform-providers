resource "aws_amplify_app" "aws_amplify_app" {
  count                               = var.create_amplify_app ? 1 : 0
  name                                = var.name
  access_token                        = var.access_token
  oauth_token                         = var.oauth_token
  repository                          = var.repository
  build_spec                          = var.build_spec
  custom_headers                      = var.custom_headers
  description                         = var.description
  enable_auto_branch_creation         = var.enable_auto_branch_creation
  auto_branch_creation_patterns       = var.auto_branch_creation_patterns
  enable_basic_auth                   = var.enable_basic_auth
  basic_auth_credentials              = var.basic_auth_credentials
  environment_variables               = var.environment_variables
  compute_role_arn                    = var.compute_role_arn
  iam_service_role_arn                = var.iam_service_role_arn
  enable_branch_auto_build            = var.enable_branch_auto_build
  enable_branch_auto_deletion         = var.enable_branch_auto_deletion
  platform                            = var.platform
  tags                                = var.tags

  dynamic "custom_rule" {
    for_each = var.custom_rules
    content {
      source    = custom_rule.value.source
      target    = custom_rule.value.target
      status    = custom_rule.value.status
      condition = custom_rule.value.condition
    }
  }

  dynamic "auto_branch_creation_config" {
    for_each = length(var.auto_branch_creation_config) > 0 ? [var.auto_branch_creation_config] : []
    content {
      basic_auth_credentials        = auto_branch_creation_config.value.basic_auth_credentials
      build_spec                    = auto_branch_creation_config.value.build_spec
      enable_auto_build             = auto_branch_creation_config.value.enable_auto_build
      enable_basic_auth             = auto_branch_creation_config.value.enable_basic_auth
      enable_performance_mode       = auto_branch_creation_config.value.enable_performance_mode
      enable_pull_request_preview   = auto_branch_creation_config.value.enable_pull_request_preview
      environment_variables         = auto_branch_creation_config.value.environment_variables
      framework                     = auto_branch_creation_config.value.framework
      pull_request_environment_name = auto_branch_creation_config.value.pull_request_environment_name
      stage                         = auto_branch_creation_config.value.stage
    }
  }

  dynamic "job_config" {
    for_each = length(var.job_config) > 0 ? [var.job_config] : []
    content {
      build_compute_type = job_config.value.build_compute_type
    }
  }

  dynamic "cache_config" {
    for_each = length(var.cache_config) > 0 ? [var.cache_config] : []
    content {
      type = cache_config.value.type
    }
  }

  lifecycle {
    prevent_destroy      = true
    create_before_destroy = true
    ignore_changes       = [access_token, oauth_token]
  }
}
