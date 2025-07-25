variable "create_amplify_app" {
  description = "Whether to create the AWS Amplify App resource."
  type        = bool
  default     = true
}

variable "amplify_app_name" {
  description = "The name of the Amplify App."
  type        = string
  validation {
    condition     = length(var.amplify_app_name) > 0
    error_message = "The amplify_app_name must not be empty."
  }
}

variable "amplify_app_custom_rules" {
  description = "A list of custom redirect rules for the Amplify App. Each rule must include a source, status, and target."
  type = list(object({
    source = string
    status = string
    target = string
  }))
  default = []
}

variable "create_amplify_branch" {
  description = "Whether to create the Amplify Branch resource."
  type        = bool
  default     = true
}

variable "amplify_branch_name" {
  description = "The name of the branch associated with the Amplify App."
  type        = string
  validation {
    condition     = length(var.amplify_branch_name) > 0
    error_message = "The amplify_branch_name must not be empty."
  }
}

variable "create_amplify_domain_association" {
  description = "Whether to create the Amplify Domain Association resource."
  type        = bool
  default     = true
}

variable "amplify_domain_name" {
  description = "The domain name to be associated with the Amplify App. Example: 'example.com'"
  type        = string
  validation {
    condition     = can(regex("^([a-zA-Z0-9]+(-[a-zA-Z0-9]+)*\\.)+[a-zA-Z]{2,}$", var.amplify_domain_name))
    error_message = "The amplify_domain_name must be a valid domain."
  }
}

variable "enable_auto_sub_domain" {
  description = "Whether to enable automatic subdomain creation for branches."
  type        = bool
  default     = false
}

variable "wait_for_verification" {
  description = "Whether to wait for the domain association to reach a verified state."
  type        = bool
  default     = true
}

variable "certificate_settings" {
  description = "Configuration for the certificate type and ARN (if CUSTOM). Valid types are 'AMPLIFY_MANAGED' or 'CUSTOM'."
  type = object({
    type                  = string
    custom_certificate_arn = optional(string)
  })
  default = null
  validation {
    condition = var.certificate_settings == null || contains(["AMPLIFY_MANAGED", "CUSTOM"], var.certificate_settings.type)
    error_message = "certificate_settings.type must be either 'AMPLIFY_MANAGED' or 'CUSTOM'."
  }
}

variable "amplify_sub_domains" {
  description = "List of subdomains to associate with the Amplify App. Each must include branch_name and prefix. Example: [{ branch_name = \"main\", prefix = \"www\" }]"
  type = list(object({
    branch_name = string
    prefix      = string
  }))
  validation {
    condition = length(var.amplify_sub_domains) > 0
    error_message = "You must specify at least one subdomain."
  }
}