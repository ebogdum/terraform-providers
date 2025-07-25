resource "aws_amplify_app" "aws_amplify_app" {
  count = var.create_amplify_app ? 1 : 0

  name = var.amplify_app_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_amplify_backend_environment" "aws_amplify_backend_environment" {
  count = var.create_amplify_backend_environment ? 1 : 0

  app_id           = var.create_amplify_app ? aws_amplify_app.aws_amplify_app[0].id : var.amplify_app_id
  environment_name = var.environment_name
  deployment_artifacts = var.deployment_artifacts
  stack_name           = var.stack_name

  lifecycle {
    prevent_destroy = true
  }

  depends_on = var.create_amplify_app ? [aws_amplify_app.aws_amplify_app] : []
}