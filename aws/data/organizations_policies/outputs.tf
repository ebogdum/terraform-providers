output "ids" {
  description = "List of all the policy ids found"
  value       = data.aws_organizations_policies.this.ids
}