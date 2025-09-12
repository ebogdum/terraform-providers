variable "account_id" {
  description = "The ID of the target account when managing member accounts. Will manage current user's account by default if omitted."
  type        = string
  default     = null

  validation {
    condition     = var.account_id == null || can(regex("^[0-9]{12}$", var.account_id))
    error_message = "data_aws_account_primary_contact, account_id must be a 12-digit AWS account ID or null."
  }
}