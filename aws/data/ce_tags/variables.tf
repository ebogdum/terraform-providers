variable "time_period" {
  description = "Configuration block for the start and end dates for retrieving the dimension values"
  type = object({
    start = string
    end   = string
  })

  validation {
    condition     = can(regex("^\\d{4}-\\d{2}-\\d{2}$", var.time_period.start)) && can(regex("^\\d{4}-\\d{2}-\\d{2}$", var.time_period.end))
    error_message = "data_aws_ce_tags, time_period start and end must be in YYYY-MM-DD format."
  }

  validation {
    condition     = var.time_period.start <= var.time_period.end
    error_message = "data_aws_ce_tags, time_period start date must be less than or equal to end date."
  }
}

variable "filter" {
  description = "Configuration block for the Expression object used to categorize costs"
  type = object({
    and = optional(list(object({
      cost_category = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      dimension = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      tag = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
    })))
    cost_category = optional(object({
      key           = optional(string)
      match_options = optional(list(string))
      values        = optional(list(string))
    }))
    dimension = optional(object({
      key           = optional(string)
      match_options = optional(list(string))
      values        = optional(list(string))
    }))
    not = optional(object({
      cost_category = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      dimension = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      tag = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
    }))
    or = optional(list(object({
      cost_category = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      dimension = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
      tag = optional(object({
        key           = optional(string)
        match_options = optional(list(string))
        values        = optional(list(string))
      }))
    })))
    tag = optional(object({
      key           = optional(string)
      match_options = optional(list(string))
      values        = optional(list(string))
    }))
  })
  default = null

  validation {
    condition     = var.filter == null || can(var.filter.cost_category) || can(var.filter.dimension) || can(var.filter.tag) || can(var.filter.and) || can(var.filter.not) || can(var.filter.or)
    error_message = "data_aws_ce_tags, filter must contain at least one of: cost_category, dimension, tag, and, not, or."
  }
}

variable "search_string" {
  description = "Value that you want to search for"
  type        = string
  default     = null

  validation {
    condition     = var.search_string == null || length(var.search_string) > 0
    error_message = "data_aws_ce_tags, search_string cannot be empty if provided."
  }
}

variable "sort_by" {
  description = "Configuration block for the value by which you want to sort the data"
  type = object({
    key        = string
    sort_order = optional(string)
  })
  default = null

  validation {
    condition     = var.sort_by == null || contains(["BlendedCost", "UnblendedCost", "AmortizedCost", "NetAmortizedCost", "NetUnblendedCost", "UsageQuantity", "NormalizedUsageAmount"], var.sort_by.key)
    error_message = "data_aws_ce_tags, sort_by key must be one of: BlendedCost, UnblendedCost, AmortizedCost, NetAmortizedCost, NetUnblendedCost, UsageQuantity, NormalizedUsageAmount."
  }

  validation {
    condition     = var.sort_by == null || var.sort_by.sort_order == null || contains(["ASCENDING", "DESCENDING"], var.sort_by.sort_order)
    error_message = "data_aws_ce_tags, sort_by sort_order must be one of: ASCENDING, DESCENDING."
  }
}

variable "tag_key" {
  description = "Key of the tag that you want to return values for"
  type        = string
  default     = null

  validation {
    condition     = var.tag_key == null || length(var.tag_key) > 0
    error_message = "data_aws_ce_tags, tag_key cannot be empty if provided."
  }
}