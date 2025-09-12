variable "parent_id" {
  type        = string
  description = "Parent ID of the organizational unit."

  validation {
    condition     = length(var.parent_id) > 0
    error_message = "data_aws_organizations_organizational_unit_descendant_organizational_units, parent_id must not be empty."
  }
}