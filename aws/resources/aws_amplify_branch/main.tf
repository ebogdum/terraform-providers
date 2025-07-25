resource "aws_amplify_app" "aws_amplify_app" {
  count = var.create_amplify_branch ? 1 : 0

  name = var.amplify_app_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_amplify_branch" "aws_amplify_branch" {
  count       = var.create_amplify_branch ? 1 : 0
  app_id      = aws_amplify_app.aws_amplify_app[0].id
  branch_name = var.branch_name

  backend_environment_arn      = var.backend_environment_arn
  basic_auth_credentials       = var.basic_auth_credentials
  description                  = var.branch_description
  display_name                 = var.display_name
  enable_auto_build            = var.enable_auto_build
  enable_basic_auth            = var.enable_basic_auth
  enable_notification          = var.enable_notification
  enable_performance_mode      = var.enable_performance_mode
  enable_pull_request_preview  = var.enable_pull_request_preview
  enable_skew_protection       = var.enable_skew_protection
  environment_variables        = var.environment_variables
  framework                    = var.framework
  pull_request_environment_name = var.pull_request_environment_name
  stage                        = var.stage
  tags                         = var.tags
  ttl                          = var.ttl

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      environment_variables
    ]
  }
}

resource "aws_cloudwatch_event_rule" "aws_cloudwatch_event_rule" {
  count       = var.create_amplify_branch && var.enable_notification ? 1 : 0
  name        = "amplify-${aws_amplify_app.aws_amplify_app[0].id}-${var.branch_name}-branch-notification"
  description = "AWS Amplify build notifications for :  App: ${aws_amplify_app.aws_amplify_app[0].id} Branch: ${var.branch_name}"

  event_pattern = jsonencode({
    detail = {
      appId = [aws_amplify_app.aws_amplify_app[0].id]
      branchName = [var.branch_name]
      jobStatus = ["SUCCEED", "FAILED", "STARTED"]
    }
    "detail-type" = ["Amplify Deployment Status Change"]
    source = ["aws.amplify"]
  })
}

resource "aws_sns_topic" "aws_sns_topic" {
  count = var.create_amplify_branch && var.enable_notification ? 1 : 0
  name  = "amplify-${aws_amplify_app.aws_amplify_app[0].id}_${var.branch_name}"
}

data "aws_iam_policy_document" "aws_iam_policy_document" {
  count = var.create_amplify_branch && var.enable_notification ? 1 : 0

  statement {
    sid       = "Allow_Publish_Events"
    effect    = "Allow"
    actions   = ["SNS:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.aws_sns_topic[0].arn]
  }
}

resource "aws_sns_topic_policy" "aws_sns_topic_policy" {
  count  = var.create_amplify_branch && var.enable_notification ? 1 : 0
  arn    = aws_sns_topic.aws_sns_topic[0].arn
  policy = data.aws_iam_policy_document.aws_iam_policy_document[0].json
}

resource "aws_cloudwatch_event_target" "aws_cloudwatch_event_target" {
  count     = var.create_amplify_branch && var.enable_notification ? 1 : 0
  rule      = aws_cloudwatch_event_rule.aws_cloudwatch_event_rule[0].name
  target_id = var.branch_name
  arn       = aws_sns_topic.aws_sns_topic[0].arn

  input_transformer {
    input_paths = {
      jobId  = "$.detail.jobId"
      appId  = "$.detail.appId"
      region = "$.region"
      branch = "$.detail.branchName"
      status = "$.detail.jobStatus"
    }
    input_template = "\"Build notification from the AWS Amplify Console for app: https://<branch>.<appId>.amplifyapp.com/. Your build status is <status>. Go to https://console.aws.amazon.com/amplify/home?region=<region>#<appId>/<branch>/<jobId> to view details on your build. \""
  }
}

resource "aws_sns_topic_subscription" "aws_sns_topic_subscription" {
  count    = var.create_amplify_branch && var.enable_notification ? 1 : 0
  topic_arn = aws_sns_topic.aws_sns_topic[0].arn
  protocol  = "email"
  endpoint  = var.notification_email
}
