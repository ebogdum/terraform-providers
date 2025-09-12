output "id" {
  description = "ID of the WAF rule"
  value       = data.aws_waf_rule.this.id
}

output "name" {
  description = "Name of the WAF rule"
  value       = data.aws_waf_rule.this.name
}