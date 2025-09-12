variable "service_name" {
  description = "Name of the service you want to generate a Service Principal Name for"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9._-]+$", var.service_name))
    error_message = "data_aws_service_principal, service_name must be a valid service name containing only alphanumeric characters, dots, underscores, and hyphens."
  }

  validation {
    condition     = length(var.service_name) > 0
    error_message = "data_aws_service_principal, service_name cannot be empty."
  }
}

variable "region" {
  description = "Region you'd like the SPN for. Defaults to the Region set in the provider configuration"
  type        = string
  default     = null

  validation {
    condition     = var.region == null ? true : can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_service_principal, region must be a valid AWS region name containing only lowercase letters, numbers, and hyphens."
  }
}