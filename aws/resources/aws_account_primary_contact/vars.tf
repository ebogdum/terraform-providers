variable "create_primary_contact" {
  description = "Indicates whether the AWS Account primary contact information should be managed. Set to true to create/update the contact."
  type        = bool
  default     = false
}

variable "primary_contact" {
  description = "A map of primary contact information for the AWS Account. All required fields must be provided."
  type = object({
    account_id          = optional(string)
    address_line_1      = string
    address_line_2      = optional(string)
    address_line_3      = optional(string)
    city                = string
    company_name        = optional(string)
    country_code        = string
    district_or_county  = optional(string)
    full_name           = string
    phone_number        = string
    postal_code         = string
    state_or_region     = optional(string)
    website_url         = optional(string)
  })
  validation {
    condition     = can(regex("^[A-Z]{2}$", var.primary_contact.country_code))
    error_message = "The country_code must be a valid ISO-3166 two-letter code (e.g., 'US')."
  }
  validation {
    condition     = can(regex("^\\+?[1-9]\\d{1,14}$", var.primary_contact.phone_number))
    error_message = "The phone_number must be a valid E.164 format (e.g., '+15551234567')."
  }
}