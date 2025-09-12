output "arn" {
  description = "The Amazon Resource Name of the policy."
  value       = data.aws_organizations_policy.this.arn
}

output "aws_managed" {
  description = "Indicates if a policy is an AWS managed policy."
  value       = data.aws_organizations_policy.this.aws_managed
}

output "content" {
  description = "The text content of the policy."
  value       = data.aws_organizations_policy.this.content
}

output "description" {
  description = "The description of the policy."
  value       = data.aws_organizations_policy.this.description
}

output "name" {
  description = "The friendly name of the policy."
  value       = data.aws_organizations_policy.this.name
}

output "policy_id" {
  description = "The unique identifier (ID) of the policy."
  value       = data.aws_organizations_policy.this.policy_id
}

output "type" {
  description = "The type of policy values can be AISERVICES_OPT_OUT_POLICY | BACKUP_POLICY | RESOURCE_CONTROL_POLICY | SERVICE_CONTROL_POLICY | TAG_POLICY."
  value       = data.aws_organizations_policy.this.type
}