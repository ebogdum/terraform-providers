variable "region" {
  description = "Name of the Region whose AWS ELB HostedZoneId is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z]{2}-[a-z]+-[0-9]+$|^us-gov-[a-z]+-[0-9]+$", var.region))
    error_message = "data_aws_elb_hosted_zone_id, region must be a valid AWS region format (e.g., us-east-1, eu-west-1, us-gov-west-1)."
  }
}