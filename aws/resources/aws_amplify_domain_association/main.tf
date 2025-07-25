resource "aws_amplify_app" "aws_amplify_app" {
  count = var.create_amplify_app ? 1 : 0

  name = var.amplify_app_name

  dynamic "custom_rule" {
    for_each = var.amplify_app_custom_rules
    content {
      source = custom_rule.value.source
      status = custom_rule.value.status
      target = custom_rule.value.target
    }
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}

resource "aws_amplify_branch" "aws_amplify_branch" {
  count       = var.create_amplify_branch ? 1 : 0
  app_id      = aws_amplify_app.aws_amplify_app[0].id
  branch_name = var.amplify_branch_name

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}

resource "aws_amplify_domain_association" "aws_amplify_domain_association" {
  count                 = var.create_amplify_domain_association ? 1 : 0
  app_id                = aws_amplify_app.aws_amplify_app[0].id
  domain_name           = var.amplify_domain_name
  enable_auto_sub_domain = var.enable_auto_sub_domain
  wait_for_verification  = var.wait_for_verification

  dynamic "certificate_settings" {
    for_each = var.certificate_settings == null ? [] : [var.certificate_settings]
    content {
      type                  = certificate_settings.value.type
      custom_certificate_arn = try(certificate_settings.value.custom_certificate_arn, null)
    }
  }

  dynamic "sub_domain" {
    for_each = var.amplify_sub_domains
    content {
      branch_name = sub_domain.value.branch_name
      prefix      = sub_domain.value.prefix
    }
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
  depends_on = [aws_amplify_branch.aws_amplify_branch]
}