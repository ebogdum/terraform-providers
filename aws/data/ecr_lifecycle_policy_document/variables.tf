variable "rules" {
  description = "List of lifecycle policy rules"
  type = list(object({
    priority    = number
    description = optional(string)
    action = optional(object({
      type = string
    }))
    selection = object({
      tag_status       = string
      tag_pattern_list = optional(list(string))
      tag_prefix_list  = optional(list(string))
      count_type       = string
      count_unit       = optional(string)
      count_number     = number
    })
  }))

  validation {
    condition = alltrue([
      for rule in var.rules : contains(["tagged", "untagged", "any"], rule.selection.tag_status)
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, tag_status must be one of: tagged, untagged, any."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : contains(["imageCountMoreThan", "sinceImagePushed"], rule.selection.count_type)
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, count_type must be one of: imageCountMoreThan, sinceImagePushed."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.action == null || rule.action.type == "expire"
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, action.type must be 'expire' when action is specified."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.tag_status == "tagged" ? (
        (rule.selection.tag_pattern_list != null && rule.selection.tag_prefix_list == null) ||
        (rule.selection.tag_pattern_list == null && rule.selection.tag_prefix_list != null)
      ) : true
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, tag_pattern_list when tag_status is 'tagged', either tag_pattern_list or tag_prefix_list must be specified, but not both."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.tag_status == "untagged" ? (
        rule.selection.tag_pattern_list == null && rule.selection.tag_prefix_list == null
      ) : true
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, tag_pattern_list and tag_prefix_list must be omitted when tag_status is 'untagged'."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.count_type == "sinceImagePushed" ? rule.selection.count_unit != null : true
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, count_unit is required when count_type is 'sinceImagePushed'."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.count_type == "imageCountMoreThan" ? rule.selection.count_unit == null : true
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, count_unit must not be specified when count_type is 'imageCountMoreThan'."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.count_unit == null || rule.selection.count_unit == "days"
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, count_unit must be 'days' when specified."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.tag_pattern_list == null || alltrue([
        for pattern in rule.selection.tag_pattern_list : length(regexall("\\*", pattern)) <= 4
      ])
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, tag_pattern_list patterns can contain a maximum of 4 wildcards (*) per string."
  }

  validation {
    condition = alltrue([
      for rule in var.rules : rule.selection.tag_status == "any" ? rule.priority == max([for r in var.rules : r.priority]...) : true
    ])
    error_message = "data_aws_ecr_lifecycle_policy_document, priority rule with tag_status 'any' must have the highest priority value and be evaluated last."
  }

  validation {
    condition     = length(var.rules) == length(distinct([for rule in var.rules : rule.priority]))
    error_message = "data_aws_ecr_lifecycle_policy_document, priority values must be unique across all rules."
  }
}