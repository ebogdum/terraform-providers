output "target_id" {
  description = "The root, account, or Organizational Unit ID"
  value       = data.aws_organizations_policies_for_target.this.target_id
}

output "filter" {
  description = "The policy filter for the target"
  value       = data.aws_organizations_policies_for_target.this.filter
}

output "ids" {
  description = "List of all the policy ids found"
  value       = data.aws_organizations_policies_for_target.this.ids
}