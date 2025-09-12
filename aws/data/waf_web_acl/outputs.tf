output "id" {
  description = "ID of the WAF Web ACL"
  value       = data.aws_waf_web_acl.this.id
}

output "name" {
  description = "Name of the WAF Web ACL"
  value       = data.aws_waf_web_acl.this.name
}