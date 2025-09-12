variable "aws_region" {
  description = "AWS Region to which the quota increases apply."
  type        = string
  default     = null

  validation {
    condition     = var.aws_region == null || can(regex("^[a-z0-9-]+$", var.aws_region))
    error_message = "data_aws_servicequotas_templates, aws_region must be a valid AWS region format (e.g., us-east-1, eu-west-1)."
  }
}

variable "region" {
  description = "(Deprecated) AWS Region to which the quota increases apply. Use aws_region instead."
  type        = string
  default     = null

  validation {
    condition     = var.region == null || can(regex("^[a-z0-9-]+$", var.region))
    error_message = "data_aws_servicequotas_templates, region must be a valid AWS region format (e.g., us-east-1, eu-west-1)."
  }
}