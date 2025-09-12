variable "parent_id" {
  description = "The parent ID of the accounts"
  type        = string

  validation {
    condition     = can(regex("^(r-[0-9a-z]{4,32}|ou-[0-9a-z]{4,32}-[0-9a-z]{8,32})$", var.parent_id))
    error_message = "data_aws_organizations_organizational_unit_child_accounts, parent_id must be a valid AWS Organizations root ID (r-) or organizational unit ID (ou-)."
  }
}