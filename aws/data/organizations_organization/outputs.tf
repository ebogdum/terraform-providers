output "arn" {
  description = "ARN of the organization"
  value       = data.aws_organizations_organization.this.arn
}

output "feature_set" {
  description = "FeatureSet of the organization"
  value       = data.aws_organizations_organization.this.feature_set
}

output "id" {
  description = "ID of the organization"
  value       = data.aws_organizations_organization.this.id
}

output "master_account_arn" {
  description = "ARN of the account that is designated as the master account for the organization"
  value       = data.aws_organizations_organization.this.master_account_arn
}

output "master_account_email" {
  description = "The email address that is associated with the AWS account that is designated as the master account for the organization"
  value       = data.aws_organizations_organization.this.master_account_email
}

output "master_account_id" {
  description = "Unique identifier (ID) of the master account of an organization"
  value       = data.aws_organizations_organization.this.master_account_id
}

output "master_account_name" {
  description = "Name of the master account of an organization"
  value       = data.aws_organizations_organization.this.master_account_name
}

output "accounts" {
  description = "List of organization accounts including the master account"
  value       = data.aws_organizations_organization.this.accounts
}

output "aws_service_access_principals" {
  description = "A list of AWS service principal names that have integration enabled with your organization"
  value       = data.aws_organizations_organization.this.aws_service_access_principals
}

output "enabled_policy_types" {
  description = "A list of Organizations policy types that are enabled in the Organization Root"
  value       = data.aws_organizations_organization.this.enabled_policy_types
}

output "non_master_accounts" {
  description = "List of organization accounts excluding the master account"
  value       = data.aws_organizations_organization.this.non_master_accounts
}

output "roots" {
  description = "List of organization roots"
  value       = data.aws_organizations_organization.this.roots
}