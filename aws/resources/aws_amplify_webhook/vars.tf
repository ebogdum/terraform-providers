variable "create_amplify_webhook" {
  description = "Determines whether the AWS Amplify webhook and its dependencies should be created. Set to true to provision resources."
  type        = bool
  default     = false
}

variable "app_name" {
  description = "The name of the Amplify App to be created. Must be unique within your AWS account."
  type        = string
  validation {
    condition     = length(var.app_name) > 0
    error_message = "The Amplify app name must not be empty."
  }
}

variable "branch_name" {
  description = "The name of the branch associated with the Amplify App. This is required for webhook configuration."
  type        = string
  validation {
    condition     = length(var.branch_name) > 0
    error_message = "The Amplify branch name must not be empty."
  }
}

variable "webhook_description" {
  description = "A human-friendly description for the Amplify webhook, such as the trigger purpose or associated branch."
  type        = string
  default     = ""
}