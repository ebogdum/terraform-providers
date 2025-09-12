output "id" {
  description = "ID of the WAF rate based rule"
  value       = data.aws_waf_rate_based_rule.this.id
}

output "name" {
  description = "Name of the WAF rate based rule"
  value       = data.aws_waf_rate_based_rule.this.name
}