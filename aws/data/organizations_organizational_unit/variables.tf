variable "parent_id" {
  description = "Parent ID of the organizational unit"
  type        = string

  validation {
    condition     = length(var.parent_id) > 0
    error_message = "data_aws_organizations_organizational_unit, parent_id must not be empty."
  }
}

variable "name" {
  description = "Name of the organizational unit"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_organizations_organizational_unit, name must not be empty."
  }
}