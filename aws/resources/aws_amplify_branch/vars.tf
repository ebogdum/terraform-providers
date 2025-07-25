variable "create_amplify_branch" {
  description = "Determines whether the Amplify branch and associated resources should be created."
  type        = bool
  default     = true
}

variable "amplify_app_name" {
  description = "Specifies the name of the Amplify App. Must be unique within the AWS account in the region."
  type        = string
}

variable "branch_name" {
  description = "Name for the Amplify branch. This should be the name of a Git branch."
  type        = string
}

variable "backend_environment_arn" {
  description = "ARN of the backend environment associated with this branch."
  type        = string
  default     = null
}

variable "basic_auth_credentials" {
  description = "Base64-encoded basic authentication credentials (e.g., base64encode(\"user:pass\")) used to protect this branch."
  type        = string
  default     = null
  sensitive   = true
}

variable "branch_description" {
  description = "Optional description for the Amplify branch."
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name used as the default domain prefix for this branch."
  type        = string
  default     = null
}

variable "enable_auto_build" {
  description = "Controls whether auto-building is enabled for the branch when code changes are pushed."
  type        = bool
  default     = true
}

variable "enable_basic_auth" {
  description = "Enables basic authentication for the branch. Must be set to true to use basic_auth_credentials."
  type        = bool
  default     = false
}

variable "enable_notification" {
  description = "Enables build and deployment notifications via SNS and EventBridge for this branch."
  type        = bool
  default     = false
}

variable "enable_performance_mode" {
  description = "Enables performance mode for the branch which optimizes hosting performance."
  type        = bool
  default     = false
}

variable "enable_pull_request_preview" {
  description = "Enables preview deployments on pull requests targeting this branch."
  type        = bool
  default     = false
}

variable "enable_skew_protection" {
  description = "Enables skew protection for the branch."
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "Map of environment variables to expose in this Amplify branch. Keys and values must be strings."
  type        = map(string)
  default     = {}
}

variable "framework" {
  description = "Framework used in the branch. Example values: 'React', 'Vue', 'Angular'."
  type        = string
  default     = null
}

variable "pull_request_environment_name" {
  description = "Unique name for the Amplify environment when pull request previews are enabled."
  type        = string
  default     = null
}

variable "stage" {
  description = "Stage identifier for the branch lifecycle. Valid values: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST."
  type        = string
  default     = null
  validation {
    condition = var.stage == null || contains(["PRODUCTION", "BETA", "DEVELOPMENT", "EXPERIMENTAL", "PULL_REQUEST"], var.stage)
    error_message = "Stage must be one of: PRODUCTION, BETA, DEVELOPMENT, EXPERIMENTAL, PULL_REQUEST."
  }
}

variable "ttl" {
  description = "Time To Live (TTL) for the web content in seconds. Must be a non-negative integer."
  type        = number
  default     = null
  validation {
    condition     = var.ttl == null || var.ttl >= 0
    error_message = "TTL must be a non-negative integer."
  }
}

variable "tags" {
  description = "Tags to assign to the Amplify branch."
  type        = map(string)
  default     = {}
}

variable "notification_email" {
  description = "Email address to subscribe to Amplify build notifications via SNS. Required if enable_notification is true."
  type        = string
  default     = null
  validation {
    condition     = var.enable_notification == false || can(regex("^[^@\s]+@[^@\s]+\.[^@\s]+$", var.notification_email))
    error_message = "Must be a valid email address for notifications if enable_notification is true."
  }
}
