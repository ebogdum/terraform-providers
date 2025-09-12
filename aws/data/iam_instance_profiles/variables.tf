variable "role_name" {
  description = "IAM role name"
  type        = string

  validation {
    condition     = length(var.role_name) > 0
    error_message = "data_aws_iam_instance_profiles, role_name must be a non-empty string."
  }

  validation {
    condition     = length(var.role_name) <= 64
    error_message = "data_aws_iam_instance_profiles, role_name must be 64 characters or less."
  }

  validation {
    condition     = can(regex("^[\\w+=,.@-]+$", var.role_name))
    error_message = "data_aws_iam_instance_profiles, role_name must contain only alphanumeric characters and the following: +=,.@-"
  }
}