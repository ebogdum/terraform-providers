variable "parent_id" {
  description = "Parent ID of the organizational unit"
  type        = string

  validation {
    condition     = can(regex("^(r-[0-9a-z]{4,32}|ou-[0-9a-z]{4,32}-[a-z0-9]{8,32})$", var.parent_id))
    error_message = "data_aws_organizations_organizational_units, parent_id must be a valid organizational unit ID (ou-*) or root ID (r-*)."
  }
}