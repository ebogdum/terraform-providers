output "amplify_domain_association_arn" {
  description = "The ARN of the Amplify Domain Association."
  value       = aws_amplify_domain_association.aws_amplify_domain_association[0].arn
}

output "amplify_domain_certificate_verification_dns_record" {
  description = "The DNS record required to verify the domain and certificate."
  value       = aws_amplify_domain_association.aws_amplify_domain_association[0].certificate_verification_dns_record
}

output "amplify_sub_domain_dns_records" {
  description = "List of DNS records for the subdomains."
  value = [
    for sd in aws_amplify_domain_association.aws_amplify_domain_association[0].sub_domain : sd.dns_record
  ]
}

output "amplify_sub_domain_verification_statuses" {
  description = "List of verified statuses for each subdomain."
  value = [
    for sd in aws_amplify_domain_association.aws_amplify_domain_association[0].sub_domain : sd.verified
  ]
}