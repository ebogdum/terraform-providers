variable "create_amplify_app" {
  description = "Boolean flag to control creation of the Amplify App resource."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name for the Amplify App."
  type        = string
}

variable "access_token" {
  description = "Personal access token for third-party source control system. Required if repository is specified."
  type        = string
  default     = null
  sensitive   = true
}

variable "oauth_token" {
  description = "OAuth token for third-party source control system."
  type        = string
  default     = null
  sensitive   = true
}

variable "repository" {
  description = "Repository URL for the Amplify App. Example: https://github.com/org/repo."
  type        = string
  default     = null
  validation {
    condition     = can(regex("^https://", var.repository)) || var.repository == null
    error_message = "Repository must be a valid HTTPS URL."
  }
}

variable "build_spec" {
  description = "Build specification YAML as a heredoc string."
  type        = string
  default     = null
}

variable "custom_headers" {
  description = "Custom HTTP headers YAML as a heredoc string."
  type        = string
  default     = null
}

variable "description" {
  description = "Description for the Amplify App."
  type        = string
  default     = null
}

variable "enable_auto_branch_creation" {
  description = "Whether to enable automatic branch creation."
  type        = bool
  default     = false
}

variable "auto_branch_creation_patterns" {
  description = "Glob patterns for automatic branch creation. Example: [\"*\", \"*/**\"]"
  type        = list(string)
  default     = []
}

variable "enable_basic_auth" {
  description = "Whether to enable basic authentication for the Amplify App."
  type        = bool
  default     = false
}

variable "basic_auth_credentials" {
  description = "Base64-encoded basic authentication credentials in the form 'username:password'."
  type        = string
  default     = null
  sensitive   = true
}

variable "environment_variables" {
  description = "Key-value map of environment variables for the Amplify App."
  type        = map(string)
  default     = {}
}

variable "compute_role_arn" {
  description = "ARN of the IAM role used as the SSR compute role."
  type        = string
  default     = null
}

variable "iam_service_role_arn" {
  description = "ARN of the IAM role used as the service role."
  type        = string
  default     = null
}

variable "enable_branch_auto_build" {
  description = "Enables branch auto-building."
  type        = bool
  default     = false
}

variable "enable_branch_auto_deletion" {
  description = "Automatically disconnects a branch in Amplify Console when the branch is deleted in its source repository."
  type        = bool
  default     = false
}

variable "platform" {
  description = "Platform type for the Amplify App. Valid values: 'WEB', 'WEB_COMPUTE'."
  type        = string
  default     = "WEB"
  validation {
    condition     = contains(["WEB", "WEB_COMPUTE"], var.platform)
    error_message = "Platform must be either 'WEB' or 'WEB_COMPUTE'."
  }
}

variable "tags" {
  description = "Key-value tags to assign to the Amplify App."
  type        = map(string)
  default     = {}
}

variable "custom_rules" {
  description = "List of custom rewrite/redirect rules. Each rule must contain 'source' and 'target'. Optional keys: 'status', 'condition'."
  type = list(object({
    source    = string
    target    = string
    status    = optional(string)
    condition = optional(string)
  }))
  default = []
}

variable "auto_branch_creation_config" {
  description = "Configuration block for auto-branch creation."
  type = object({
    basic_auth_credentials        = optional(string)
    build_spec                    = optional(string)
    enable_auto_build             = optional(bool)
    enable_basic_auth             = optional(bool)
    enable_performance_mode       = optional(bool)
    enable_pull_request_preview   = optional(bool)
    environment_variables         = optional(map(string))
    framework                     = optional(string)
    pull_request_environment_name = optional(string)
    stage                         = optional(string)
  })
  default = {}
  sensitive = true
}

variable "job_config" {
  description = "Configuration block for build instance compute type."
  type = object({
    build_compute_type = optional(string)
  })
  default = {}
}

variable "cache_config" {
  description = "Configuration block for Amplify App cache settings."
  type = object({
    type = string
  })
  default = {}
  validation {
    condition     = var.cache_config.type == "AMPLIFY_MANAGED" || var.cache_config.type == "AMPLIFY_MANAGED_NO_COOKIES"
    error_message = "cache_config.type must be 'AMPLIFY_MANAGED' or 'AMPLIFY_MANAGED_NO_COOKIES'."
  }
}
