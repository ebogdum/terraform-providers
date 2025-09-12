variable "name" {
  description = "Friendly IAM role name to match"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_iam_role, name must not be empty."
  }
}