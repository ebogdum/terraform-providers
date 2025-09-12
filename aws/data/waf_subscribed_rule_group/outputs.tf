output "id" {
  description = "ID of the WAF rule group"
  value       = data.aws_waf_subscribed_rule_group.this.id
}

output "name" {
  description = "Name of the WAF rule group"
  value       = data.aws_waf_subscribed_rule_group.this.name
}

output "metric_name" {
  description = "Metric name of the WAF rule group"
  value       = data.aws_waf_subscribed_rule_group.this.metric_name
}