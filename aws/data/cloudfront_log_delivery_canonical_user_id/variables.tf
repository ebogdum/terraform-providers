variable "region" {
  description = "Name of the Region whose canonical user ID is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9][a-z0-9\\-]*$", var.region))
    error_message = "data_aws_cloudfront_log_delivery_canonical_user_id, region must be a valid AWS region name or null."
  }
}