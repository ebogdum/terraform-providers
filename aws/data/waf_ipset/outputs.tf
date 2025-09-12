output "id" {
  description = "ID of the WAF IP set"
  value       = data.aws_waf_ipset.this.id
}