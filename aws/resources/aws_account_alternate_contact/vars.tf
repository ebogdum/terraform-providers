variable "create_alternate_contacts" {
  description = "Controls whether alternate contacts should be created. Set to true to enable deployment of alternate contacts."
  type        = bool
  default     = false
}

variable "alternate_contacts" {
  description = "List of alternate contacts to configure for AWS accounts. Each object must include contact details and type. Optional 'account_id' targets a specific account."
  type = list(object({
    account_id             = optional(string)
    alternate_contact_type = string
    email_address          = string
    name                   = string
    phone_number           = string
    title                  = string
  }))

  validation {
    condition = alltrue([
      for contact in var.alternate_contacts : can(regex("^(BILLING|OPERATIONS|SECURITY)$", contact.alternate_contact_type))
    ])
    error_message = "Each alternate_contact_type must be one of: BILLING, OPERATIONS, SECURITY."
  }

  validation {
    condition = alltrue([
      for contact in var.alternate_contacts : can(regex("^[^@\s]+@[^@\s]+\.[^@\s]+$", contact.email_address))
    ])
    error_message = "Each email_address must be a valid email format."
  }

  validation {
    condition = alltrue([
      for contact in var.alternate_contacts : can(regex("^\+?[1-9]\d{1,14}$", contact.phone_number))
    ])
    error_message = "Each phone_number must be in valid international E.164 format (e.g., +1234567890)."
  }
  default = []
}