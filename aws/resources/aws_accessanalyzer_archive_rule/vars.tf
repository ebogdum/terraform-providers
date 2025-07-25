variable "create_accessanalyzer_archive_rule" {
  description = "Determines whether the AWS Access Analyzer Archive Rule resource should be created. Set to true to create the resource."
  type        = bool
  default     = false
}

variable "analyzer_name" {
  description = "The name of the AWS Access Analyzer analyzer to attach the archive rule to. Must be an existing analyzer."
  type        = string
  validation {
    condition     = length(var.analyzer_name) > 0
    error_message = "The analyzer_name must not be an empty string."
  }
}

variable "rule_name" {
  description = "The name of the archive rule to be created in the specified analyzer. Must be unique within the analyzer."
  type        = string
  validation {
    condition     = length(var.rule_name) > 0
    error_message = "The rule_name must not be an empty string."
  }
}

variable "filters" {
  description = "A list of filter objects defining the criteria used to archive findings. Each filter must include one comparator among 'contains', 'eq', 'exists', or 'neq'. Example: [{ criteria = \"isPublic\", eq = [\"false\"] }]"
  type = list(object({
    criteria = string
    contains = optional(list(string))
    eq       = optional(list(string))
    exists   = optional(bool)
    neq      = optional(list(string))
  }))
  validation {
    condition = alltrue([
      for f in var.filters :
      (f.contains != null ? 1 : 0) +
      (f.eq != null ? 1 : 0) +
      (f.exists != null ? 1 : 0) +
      (f.neq != null ? 1 : 0)
      == 1
    ])
    error_message = "Each filter must have exactly one comparator: 'contains', 'eq', 'exists', or 'neq'."
  }
  default = []
}