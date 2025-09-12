variable "region" {
  description = "Name of the Region whose AWS App Runner service HostedZoneId is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_apprunner_hosted_zone_id, region must be a valid AWS region name containing only lowercase letters, numbers, and hyphens."
  }
}