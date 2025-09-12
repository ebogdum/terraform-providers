data "aws_iam_server_certificate" "this" {
  name_prefix = var.name_prefix
  path_prefix = var.path_prefix
  name        = var.name
  latest      = var.latest
}