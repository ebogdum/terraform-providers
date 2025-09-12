data "aws_cloudfront_origin_request_policy" "this" {
  name = var.name
  id   = var.id
}