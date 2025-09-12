resource "aws_route53_query_log" "this" {
  cloudwatch_log_group_arn = var.cloudwatch_log_group_arn
  zone_id                  = var.zone_id
}