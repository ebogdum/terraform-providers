data "aws_iam_policy" "this" {
  arn  = var.arn
  name = var.arn == null ? var.name : null
  # path_prefix only applies when searching by name
  path_prefix = var.arn == null ? var.path_prefix : null
}