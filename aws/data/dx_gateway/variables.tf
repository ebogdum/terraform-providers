variable "name" {
  description = "Name of the gateway to retrieve"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_dx_gateway, name must not be empty."
  }
}