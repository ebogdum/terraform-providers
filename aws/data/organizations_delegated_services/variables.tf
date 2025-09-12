variable "account_id" {
  description = "Account ID number of a delegated administrator account in the organization"
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "data_aws_organizations_delegated_services, account_id must be a valid 12-digit AWS account ID."
  }
}