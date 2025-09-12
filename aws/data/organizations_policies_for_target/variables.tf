variable "target_id" {
  description = "The root (string that begins with \"r-\" followed by 4-32 lowercase letters or digits), account (12 digit string), or Organizational Unit (string starting with \"ou-\" followed by 4-32 lowercase letters or digits. This string is followed by a second \"-\" dash and from 8-32 additional lowercase letters or digits.)"
  type        = string

  validation {
    condition     = can(regex("^(r-[a-z0-9]{4,32}|[0-9]{12}|ou-[a-z0-9]{4,32}-[a-z0-9]{8,32})$", var.target_id))
    error_message = "data_aws_organizations_policies_for_target, target_id must be a root (string that begins with \"r-\" followed by 4-32 lowercase letters or digits), account (12 digit string), or Organizational Unit (string starting with \"ou-\" followed by 4-32 lowercase letters or digits. This string is followed by a second \"-\" dash and from 8-32 additional lowercase letters or digits.)"
  }
}

variable "filter" {
  description = "Must supply one of the 5 different policy filters for a target"
  type        = string

  validation {
    condition     = contains(["AISERVICES_OPT_OUT_POLICY", "BACKUP_POLICY", "RESOURCE_CONTROL_POLICY", "SERVICE_CONTROL_POLICY", "TAG_POLICY"], var.filter)
    error_message = "data_aws_organizations_policies_for_target, filter must be one of: AISERVICES_OPT_OUT_POLICY, BACKUP_POLICY, RESOURCE_CONTROL_POLICY, SERVICE_CONTROL_POLICY, TAG_POLICY."
  }
}