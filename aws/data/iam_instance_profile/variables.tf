variable "name" {
  description = "Friendly IAM instance profile name to match"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_iam_instance_profile, name must not be empty."
  }
}