variable "arn" {
  description = "ARN of the IAM policy. Conflicts with name and path_prefix."
  type        = string
  default     = null

  validation {
    condition     = var.arn == null || (var.arn != null && var.name == null)
    error_message = "data_aws_iam_policy, arn: arn conflicts with name. Only arn or name may be specified."
  }
}

variable "name" {
  description = "Name of the IAM policy. Conflicts with arn."
  type        = string
  default     = null

  validation {
    condition     = var.name == null || length(trimspace(var.name)) > 0
    error_message = "data_aws_iam_policy, name: if provided, name must be a non-empty string."
  }
}

variable "path_prefix" {
  description = "Prefix of the path to the IAM policy when searching by name. Defaults to '/'. Ignored when arn is provided."
  type        = string
  default     = "/"

  validation {
    condition     = var.path_prefix == null || startswith(var.path_prefix, "/")
    error_message = "data_aws_iam_policy, path_prefix: if provided, must start with '/'."
  }
}

variable "require_policy_identifier" {
  description = "Internal validation to ensure at least one identifier is provided"
  type        = bool
  default     = true

  validation {
    condition     = (var.require_policy_identifier == false) || var.arn != null || var.name != null
    error_message = "data_aws_iam_policy, require_policy_identifier: At least one of arn or name must be specified."
  }
}