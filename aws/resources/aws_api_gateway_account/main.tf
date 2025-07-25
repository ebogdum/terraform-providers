data "aws_iam_policy_document" "aws_iam_policy_document_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "aws_iam_role_cloudwatch" {
  count              = var.enable_api_gateway_account ? 1 : 0
  name               = var.cloudwatch_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.aws_iam_policy_document_assume_role.json

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

data "aws_iam_policy_document" "aws_iam_policy_document_cloudwatch" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:FilterLogEvents"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "aws_iam_role_policy_cloudwatch" {
  count  = var.enable_api_gateway_account ? 1 : 0
  name   = "default"
  role   = aws_iam_role.aws_iam_role_cloudwatch[0].id
  policy = data.aws_iam_policy_document.aws_iam_policy_document_cloudwatch.json

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}

resource "aws_api_gateway_account" "aws_api_gateway_account" {
  count                = var.enable_api_gateway_account ? 1 : 0
  cloudwatch_role_arn  = aws_iam_role.aws_iam_role_cloudwatch[0].arn
  reset_on_delete      = var.cloudwatch_reset_on_delete

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}