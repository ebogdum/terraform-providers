variable "account_id" {
  description = "AWS account ID to configure. Defaults to automatically determined account ID of the Terraform AWS provider."
  type        = string
  default     = null

  validation {
    condition     = var.account_id == null || can(regex("^[0-9]{12}$", var.account_id))
    error_message = "data_aws_s3_account_public_access_block, account_id must be a 12-digit AWS account ID or null."
  }
}