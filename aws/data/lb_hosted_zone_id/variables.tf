variable "region" {
  description = "Name of the Region whose AWS ELB HostedZoneId is desired. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "load_balancer_type" {
  description = "Type of load balancer to create. Possible values are application or network. The default value is application."
  type        = string
  default     = "application"

  validation {
    condition     = contains(["application", "network"], var.load_balancer_type)
    error_message = "data_aws_lb_hosted_zone_id, load_balancer_type must be either 'application' or 'network'."
  }
}