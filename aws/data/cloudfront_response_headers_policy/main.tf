data "aws_cloudfront_response_headers_policy" "this" {
  name = var.name
  id   = var.id
}