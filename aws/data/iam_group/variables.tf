variable "group_name" {
  description = "Friendly IAM group name to match"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9+=,.@_-]+$", var.group_name))
    error_message = "data_aws_iam_group, group_name must contain only alphanumeric characters and the following: +=,.@_-"
  }

  validation {
    condition     = length(var.group_name) >= 1 && length(var.group_name) <= 128
    error_message = "data_aws_iam_group, group_name must be between 1 and 128 characters long"
  }
}