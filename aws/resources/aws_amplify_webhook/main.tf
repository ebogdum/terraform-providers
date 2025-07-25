resource "aws_amplify_app" "aws_amplify_app" {
  count = var.create_amplify_webhook ? 1 : 0

  name = var.app_name

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

resource "aws_amplify_branch" "aws_amplify_branch" {
  count = var.create_amplify_webhook ? 1 : 0

  app_id      = aws_amplify_app.aws_amplify_app[0].id
  branch_name = var.branch_name

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

resource "aws_amplify_webhook" "aws_amplify_webhook" {
  count = var.create_amplify_webhook ? 1 : 0

  app_id      = aws_amplify_app.aws_amplify_app[0].id
  branch_name = aws_amplify_branch.aws_amplify_branch[0].branch_name
  description = var.webhook_description

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}