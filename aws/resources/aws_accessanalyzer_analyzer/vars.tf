variable "create_access_analyzer" {
  description = "Flag to determine whether to create the AWS Access Analyzer. Set to true to deploy the analyzer."
  type        = bool
  default     = true
}

variable "analyzer_name" {
  description = "Specifies the name of the AWS Access Analyzer. The name must be unique per region and account."
  type        = string
  validation {
    condition     = length(var.analyzer_name) > 0 && length(var.analyzer_name) <= 255
    error_message = "The analyzer_name must be between 1 and 255 characters."
  }
}

variable "analyzer_type" {
  description = "The scope of the AWS Access Analyzer. Must be one of: ACCOUNT, ACCOUNT_INTERNAL_ACCESS, ACCOUNT_UNUSED_ACCESS, ORGANIZATION, ORGANIZATION_INTERNAL_ACCESS, ORGANIZATION_UNUSED_ACCESS. Defaults to ACCOUNT."
  type        = string
  default     = "ACCOUNT"
  validation {
    condition     = contains(["ACCOUNT", "ACCOUNT_INTERNAL_ACCESS", "ACCOUNT_UNUSED_ACCESS", "ORGANIZATION", "ORGANIZATION_INTERNAL_ACCESS", "ORGANIZATION_UNUSED_ACCESS"], var.analyzer_type)
    error_message = "analyzer_type must be one of: ACCOUNT, ACCOUNT_INTERNAL_ACCESS, ACCOUNT_UNUSED_ACCESS, ORGANIZATION, ORGANIZATION_INTERNAL_ACCESS, ORGANIZATION_UNUSED_ACCESS."
  }
}

variable "analyzer_tags" {
  description = "Key-value map of tags to assign to the Access Analyzer resource. Used for organizing and categorizing AWS resources."
  type        = map(string)
  default     = {}
}

variable "analyzer_configuration" {
  description = "Optional configuration block for the analyzer. This can include definitions for internal_access or unused_access configurations and their analysis rules."
  type = object({
    internal_access = optional(object({
      analysis_rule = optional(list(object({
        inclusion = optional(object({
          account_ids    = optional(list(string))
          resource_arns  = optional(list(string))
          resource_types = optional(list(string))
        }))
      })))
    }))

    unused_access = optional(object({
      unused_access_age = number
      analysis_rule = optional(list(object({
        exclusion = optional(list(object({
          account_ids   = optional(list(string))
          resource_tags = optional(list(map(string)))
        })))
      })))
    }))
  })
  default = null
}