variable "all_regions" {
  description = "If true the source will query all regions regardless of availability."
  type        = bool
  default     = null

  validation {
    condition     = var.all_regions == null || can(var.all_regions)
    error_message = "data_aws_regions, all_regions must be a boolean value."
  }
}

variable "filter" {
  description = "Configuration block(s) to use as filters."
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = []

  validation {
    condition = alltrue([
      for f in var.filter : f.name != null && f.name != ""
    ])
    error_message = "data_aws_regions, filter name is required and cannot be empty."
  }

  validation {
    condition = alltrue([
      for f in var.filter : length(f.values) > 0
    ])
    error_message = "data_aws_regions, filter values must contain at least one value."
  }

  validation {
    condition = alltrue([
      for f in var.filter : alltrue([
        for v in f.values : v != null && v != ""
      ])
    ])
    error_message = "data_aws_regions, filter values cannot be null or empty strings."
  }
}