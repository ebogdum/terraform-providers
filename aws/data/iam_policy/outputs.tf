output "arn" {
  description = "ARN of the policy."
  value       = data.aws_iam_policy.this.arn
}

output "attachment_count" {
  description = "Number of entities (users, groups, and roles) that the policy is attached to."
  value       = data.aws_iam_policy.this.attachment_count
}

output "path" {
  description = "Path to the policy."
  value       = data.aws_iam_policy.this.path
}

output "description" {
  description = "Description of the policy."
  value       = data.aws_iam_policy.this.description
}

output "policy" {
  description = "Policy document of the policy."
  value       = data.aws_iam_policy.this.policy
}

output "policy_id" {
  description = "Policy's ID."
  value       = data.aws_iam_policy.this.policy_id
}

output "tags" {
  description = "Key-value mapping of tags for the IAM Policy."
  value       = data.aws_iam_policy.this.tags
}