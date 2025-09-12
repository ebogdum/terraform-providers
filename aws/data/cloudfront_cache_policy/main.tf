data "aws_cloudfront_cache_policy" "this" {
  name = var.name
  id   = var.id
}