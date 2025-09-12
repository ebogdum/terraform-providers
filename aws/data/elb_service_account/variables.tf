variable "region" {
  description = "Name of the Region whose AWS ELB account ID is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_elb_service_account, region must be a valid AWS region identifier (letters, numbers, and hyphens only)."
  }
}