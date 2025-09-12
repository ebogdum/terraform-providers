variable "policy_id" {
  description = "The unique identifier (ID) of the policy that you want more details on. Policy id starts with a 'p-' followed by 8-28 lowercase or uppercase letters, digits, and underscores."
  type        = string

  validation {
    condition     = can(regex("^p-[a-zA-Z0-9_]{8,28}$", var.policy_id))
    error_message = "data_aws_organizations_policy, policy_id must start with 'p-' followed by 8-28 lowercase or uppercase letters, digits, and underscores."
  }
}