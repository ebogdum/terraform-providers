variable "user" {
  description = "Name of the IAM user associated with the access keys"
  type        = string

  validation {
    condition     = length(var.user) > 0
    error_message = "data_aws_iam_access_keys, user must not be empty."
  }
}