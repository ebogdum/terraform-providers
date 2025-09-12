variable "arn" {
  description = "Full ARN of the custom routing accelerator"
  type        = string
  default     = null

  validation {
    condition     = var.arn == null || can(regex("^arn:aws:globalaccelerator::[0-9]{12}:accelerator/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$", var.arn))
    error_message = "data_aws_globalaccelerator_custom_routing_accelerator, arn must be a valid Global Accelerator ARN format."
  }
}

variable "name" {
  description = "Unique name of the custom routing accelerator"
  type        = string
  default     = null

  validation {
    condition     = var.name == null || (length(var.name) >= 1 && length(var.name) <= 255)
    error_message = "data_aws_globalaccelerator_custom_routing_accelerator, name must be between 1 and 255 characters long."
  }

  validation {
    condition     = var.name == null || can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-])*[a-zA-Z0-9]$", var.name))
    error_message = "data_aws_globalaccelerator_custom_routing_accelerator, name must start and end with alphanumeric characters and can contain hyphens."
  }
}