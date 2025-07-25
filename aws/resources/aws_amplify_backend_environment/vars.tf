variable "create_amplify_app" {
  description = "Boolean flag to control creation of the Amplify app. Set to true to create a new Amplify app or false to use an existing one."
  type        = bool
  default     = true
}

variable "amplify_app_name" {
  description = "The name of the Amplify app to be created if 'create_amplify_app' is true. Required when creating a new Amplify app."
  type        = string
  default     = ""
  validation {
    condition     = var.create_amplify_app == false || length(var.amplify_app_name) > 0
    error_message = "You must provide a valid 'amplify_app_name' when 'create_amplify_app' is true."
  }
}

variable "amplify_app_id" {
  description = "The unique ID of an existing Amplify app to use. Required when 'create_amplify_app' is false."
  type        = string
  default     = ""
  validation {
    condition     = var.create_amplify_app == true || length(var.amplify_app_id) > 0
    error_message = "You must provide a valid 'amplify_app_id' when 'create_amplify_app' is false."
  }
}

variable "create_amplify_backend_environment" {
  description = "Boolean flag to control creation of the Amplify backend environment resource."
  type        = bool
  default     = true
}

variable "environment_name" {
  description = "The name for the Amplify backend environment (e.g., 'dev', 'prod'). Must be a valid string."
  type        = string
  validation {
    condition     = length(var.environment_name) > 0
    error_message = "The 'environment_name' must not be empty."
  }
}

variable "deployment_artifacts" {
  description = "Optional name of the deployment artifacts associated with the Amplify backend environment. If not specified, it will not be set."
  type        = string
  default     = ""
}

variable "stack_name" {
  description = "Optional AWS CloudFormation stack name associated with the Amplify backend environment. If not specified, it will not be set."
  type        = string
  default     = ""
}