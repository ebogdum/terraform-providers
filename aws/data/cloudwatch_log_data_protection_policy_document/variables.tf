variable "name" {
  description = "The name of the data protection policy document"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, name must not be empty."
  }
}

variable "description" {
  description = "Description of the data protection policy document"
  type        = string
  default     = null
}

variable "policy_version" {
  description = "Version of the data protection policy document"
  type        = string
  default     = null
}

variable "statement" {
  description = "Configures the data protection policy"
  type = list(object({
    sid              = optional(string)
    data_identifiers = list(string)
    operation = object({
      audit = optional(object({
        findings_destination = object({
          cloudwatch_logs = optional(object({
            log_group = string
          }))
          firehose = optional(object({
            delivery_stream = string
          }))
          s3 = optional(object({
            bucket = string
          }))
        })
      }))
      deidentify = optional(object({
        mask_config = object({})
      }))
    })
  }))

  validation {
    condition     = length(var.statement) > 0
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, statement must contain at least one statement."
  }

  validation {
    condition     = length(var.statement) == 2
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, statement must contain exactly two statements: one with audit operation and one with deidentify operation."
  }

  validation {
    condition = alltrue([
      for stmt in var.statement : length(stmt.data_identifiers) >= 1
    ])
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, statement data_identifiers must contain at least 1 sensitive data identifier."
  }

  validation {
    condition = alltrue([
      for stmt in var.statement : (
        (stmt.operation.audit != null && stmt.operation.deidentify == null) ||
        (stmt.operation.audit == null && stmt.operation.deidentify != null)
      )
    ])
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, statement operation must specify exactly one operation (audit or deidentify)."
  }
}

variable "configuration" {
  description = "Configuration block for custom data identifiers"
  type = object({
    custom_data_identifier = optional(list(object({
      name  = string
      regex = string
    })))
  })
  default = null

  validation {
    condition = var.configuration == null || (
      var.configuration.custom_data_identifier == null ||
      alltrue([
        for cdi in var.configuration.custom_data_identifier :
        length(cdi.name) > 0 && length(cdi.regex) > 0
      ])
    )
    error_message = "data_aws_cloudwatch_log_data_protection_policy_document, configuration custom_data_identifier name and regex must not be empty."
  }
}