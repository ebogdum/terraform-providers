variable "region" {
  description = "Name of the Region whose hosted zone is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_elastic_beanstalk_hosted_zone, region must be a valid AWS region name containing only lowercase letters, numbers, and hyphens."
  }
}