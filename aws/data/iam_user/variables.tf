variable "user_name" {
  description = "Friendly IAM user name to match"
  type        = string

  validation {
    condition     = length(var.user_name) > 0
    error_message = "data_aws_iam_user, user_name must not be empty."
  }
}