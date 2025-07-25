variable "enable_api_gateway_account" {
  description = "Boolean flag to enable or disable the creation of the API Gateway Account and associated IAM resources. Set to true to enable."
  type        = bool
}

variable "cloudwatch_iam_role_name" {
  description = "The name to assign to the IAM role used by API Gateway for publishing logs to CloudWatch. Must be unique within the AWS account."
  type        = string
  validation {
    condition     = length(var.cloudwatch_iam_role_name) > 0 && length(var.cloudwatch_iam_role_name) <= 64
    error_message = "The CloudWatch IAM role name must be a non-empty string with a maximum length of 64 characters."
  }
}

variable "cloudwatch_reset_on_delete" {
  description = "Indicates whether to reset the API Gateway account settings to default upon destroying the resource. If true, all custom settings will be removed upon destroy."
  type        = bool
  default     = false
}