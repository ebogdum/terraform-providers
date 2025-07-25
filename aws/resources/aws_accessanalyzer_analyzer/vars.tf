variable "create_access_analyzer" {
  description = "Flag to determine whether to create the AWS IAM Access Analyzer. Set to true to enable creation."
  type        = bool
  default     = true
}

variable "analyzer_name" {
  description = "The unique name of the IAM Access Analyzer to create. Must be unique within the account or organization."
  type        = string
  validation {
    condition     = length(var.analyzer_name) > 0
    error_message = "The analyzer_name must not be empty."
  }
}

variable "analyzer_type" {
  description = "The type that represents the zone of trust or scope for the analyzer. Valid options are: ACCOUNT, ACCOUNT_INTERNAL_ACCESS, ACCOUNT_UNUSED_ACCESS, ORGANIZATION, ORGANIZATION_INTERNAL_ACCESS, ORGANIZATION_UNUSED_ACCESS. Defaults to ACCOUNT."
  type        = string
  default     = "ACCOUNT"
  validation {
    condition     = contains(["ACCOUNT", "ACCOUNT_INTERNAL_ACCESS", "ACCOUNT_UNUSED_ACCESS", "ORGANIZATION", "ORGANIZATION_INTERNAL_ACCESS", "ORGANIZATION_UNUSED_ACCESS"], var.analyzer_type)
    error_message = "The analyzer_type must be one of: ACCOUNT, ACCOUNT_INTERNAL_ACCESS, ACCOUNT_UNUSED_ACCESS, ORGANIZATION, ORGANIZATION_INTERNAL_ACCESS, ORGANIZATION_UNUSED_ACCESS."
  }
}

variable "analyzer_tags" {
  description = "A map of tags to assign to the analyzer resource. Example: { Environment = \"production\" }"
  type        = map(string)
  default     = {}
}

variable "analyzer_configuration" {
  description = "Optional nested configuration for the Access Analyzer resource. Includes internal_access and unused_access configurations."
  type = object({
    internal_access = optional(object({
      analysis_rule = list(object({
        inclusion = optional(list(object({
          account_ids    = optional(list(string))
          resource_arns  = optional(list(string))
          resource_types = optional(list(string))
        }))
      }))
    }))
    unused_access = optional(object({
      unused_access_age = number
      analysis_rule = list(object({
        exclusion = optional(list(object({
          account_ids   = optional(list(string))
          resource_tags = optional(list(map(string)))
        })))
      }))
    }))
  })
  default = null
}