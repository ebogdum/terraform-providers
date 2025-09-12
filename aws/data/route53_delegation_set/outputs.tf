output "id" {
  description = "Delegation set ID"
  value       = data.aws_route53_delegation_set.this.id
}

output "arn" {
  description = "ARN of the Delegation Set"
  value       = data.aws_route53_delegation_set.this.arn
}

output "caller_reference" {
  description = "Caller Reference of the delegation set"
  value       = data.aws_route53_delegation_set.this.caller_reference
}

output "name_servers" {
  description = "List of DNS name servers for the delegation set"
  value       = data.aws_route53_delegation_set.this.name_servers
}