variable "name_regex" {
  description = "Regex string to apply to the IAM roles list returned by AWS. This allows more advanced filtering not supported from the AWS API. This filtering is done locally on what AWS returns, and could have a performance impact if the result is large. Combine this with other options to narrow down the list AWS returns."
  type        = string
  default     = null

  validation {
    condition     = var.name_regex == null || can(regex(var.name_regex, ""))
    error_message = "data_aws_iam_roles, name_regex must be a valid regular expression."
  }
}

variable "path_prefix" {
  description = "Path prefix for filtering the results. For example, the prefix `/application_abc/component_xyz/` gets all roles whose path starts with `/application_abc/component_xyz/`. If it is not included, it defaults to a slash (`/`), listing all roles."
  type        = string
  default     = null

  validation {
    condition     = var.path_prefix == null || can(regex("^/", var.path_prefix))
    error_message = "data_aws_iam_roles, path_prefix must start with a forward slash (/)."
  }

  validation {
    condition     = var.path_prefix == null || can(regex("/$", var.path_prefix))
    error_message = "data_aws_iam_roles, path_prefix must end with a forward slash (/)."
  }
}