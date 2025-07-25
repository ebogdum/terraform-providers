variable "create_acmpca_certificate_authority" {
  description = "Specifies whether to create the ACM PCA certificate authority resource. Set to true to enable creation."
  type        = bool
  default     = true
}

variable "certificate_authority_configuration" {
  description = "Configuration block specifying key algorithm, signing algorithm, and certificate subject for the certificate authority."
  type = object({
    key_algorithm     = string
    signing_algorithm = string
    subject = object({
      common_name                  = optional(string)
      country                      = optional(string)
      distinguished_name_qualifier = optional(string)
      generation_qualifier         = optional(string)
      given_name                   = optional(string)
      initials                     = optional(string)
      locality                     = optional(string)
      organization                 = optional(string)
      organizational_unit          = optional(string)
      pseudonym                    = optional(string)
      state                        = optional(string)
      surname                      = optional(string)
      title                        = optional(string)
    })
  })
}

variable "enabled" {
  description = "Indicates whether the certificate authority is enabled. Must be true to issue certificates."
  type        = bool
  default     = true
}

variable "usage_mode" {
  description = "Specifies whether the CA issues general-purpose or short-lived certificates. Valid values: GENERAL_PURPOSE, SHORT_LIVED_CERTIFICATE."
  type        = string
  default     = "GENERAL_PURPOSE"
  validation {
    condition     = contains(["GENERAL_PURPOSE", "SHORT_LIVED_CERTIFICATE"], var.usage_mode)
    error_message = "usage_mode must be either 'GENERAL_PURPOSE' or 'SHORT_LIVED_CERTIFICATE'."
  }
}

variable "type" {
  description = "Specifies whether the CA is a ROOT or SUBORDINATE certificate authority."
  type        = string
  default     = "SUBORDINATE"
  validation {
    condition     = contains(["ROOT", "SUBORDINATE"], var.type)
    error_message = "type must be either 'ROOT' or 'SUBORDINATE'."
  }
}

variable "key_storage_security_standard" {
  description = "Cryptographic key management compliance standard for CA key storage. Valid values: FIPS_140_2_LEVEL_3_OR_HIGHER, FIPS_140_2_LEVEL_2_OR_HIGHER."
  type        = string
  default     = "FIPS_140_2_LEVEL_3_OR_HIGHER"
  validation {
    condition     = contains(["FIPS_140_2_LEVEL_3_OR_HIGHER", "FIPS_140_2_LEVEL_2_OR_HIGHER"], var.key_storage_security_standard)
    error_message = "key_storage_security_standard must be one of 'FIPS_140_2_LEVEL_3_OR_HIGHER' or 'FIPS_140_2_LEVEL_2_OR_HIGHER'."
  }
}

variable "permanent_deletion_time_in_days" {
  description = "Number of days the CA is restorable after deletion. Must be between 7 and 30 days."
  type        = number
  default     = 30
  validation {
    condition     = var.permanent_deletion_time_in_days >= 7 && var.permanent_deletion_time_in_days <= 30
    error_message = "permanent_deletion_time_in_days must be between 7 and 30 inclusive."
  }
}

variable "tags" {
  description = "Key-value map of tags to assign to the certificate authority. These assist with resource categorization and cost allocation"
  type        = map(string)
  default     = {}
}

variable "revocation_configuration" {
  description = "Configuration block to enable CRL and/or OCSP certificate revocation services. Configure empty/null to disable revocation."
  type = object({
    crl_configuration = optional(object({
      custom_cname       = optional(string)
      enabled            = optional(bool)
      expiration_in_days = optional(number)
      s3_bucket_name     = optional(string)
      s3_object_acl      = optional(string)
    }))
    ocsp_configuration = optional(object({
      enabled            = bool
      ocsp_custom_cname = optional(string)
    }))
  })
  default = null
}