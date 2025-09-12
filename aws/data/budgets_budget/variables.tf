variable "name" {
  description = "The name of a budget. Unique within accounts."
  type        = string
  default     = null

  validation {
    condition     = var.name != null || var.name_prefix != null
    error_message = "data_aws_budgets_budget, name: Either name or name_prefix must be provided."
  }
}

variable "account_id" {
  description = "The ID of the target account for budget. Will use current user's account_id by default if omitted."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "The prefix of the name of a budget. Unique within accounts."
  type        = string
  default     = null
}