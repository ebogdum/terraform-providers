variable "create_acm_certificate" {
  description = "Controls whether the ACM certificate resource should be created. Set to true to create the ACM certificate."
  type        = bool
}

variable "acm_domain_name" {
  description = "The fully qualified domain name (FQDN) for which the ACM certificate should be issued. Example: 'example.com'."
  type        = string
}

variable "acm_validation_method" {
  description = "The method to use for domain validation. Valid values are 'DNS' or 'EMAIL'. This must not be set for imported certificates."
  type        = string
  validation {
    condition     = contains(["DNS", "EMAIL"], var.acm_validation_method)
    error_message = "Validation method must be either 'DNS' or 'EMAIL'."
  }
}

variable "acm_subject_alternative_names" {
  description = "A list of domains that should be included in the Subject Alternative Name (SAN) extension of the ACM certificate."
  type        = list(string)
  default     = []
}

variable "acm_key_algorithm" {
  description = "The algorithm of the key pair used to generate the certificate. Example: 'RSA_2048' or 'EC_prime256v1'."
  type        = string
  default     = null
}

variable "acm_certificate_authority_arn" {
  description = "The ARN of the ACM Private Certificate Authority (PCA) to issue the certificate from. Required only for private certificates."
  type        = string
  default     = null
}

variable "acm_private_key" {
  description = "PEM-formatted private key for an imported certificate. Required if importing a certificate."
  type        = string
  default     = null
  sensitive   = true
}

variable "acm_certificate_body" {
  description = "PEM-formatted certificate body for an imported certificate. Required if importing a certificate."
  type        = string
  default     = null
  sensitive   = true
}

variable "acm_certificate_chain" {
  description = "PEM-formatted certificate chain for an imported certificate. Optional if importing a certificate."
  type        = string
  default     = null
  sensitive   = true
}

variable "acm_early_renewal_duration" {
  description = "Duration before expiration to start the automatic renewal process for private certificates. Format: RFC 3339 duration (e.g., 'P90D') or duration string like '2160h'."
  type        = string
  default     = null
}

variable "acm_tags" {
  description = "A map of tags to assign to the ACM certificate resource."
  type        = map(string)
  default     = {}
}

variable "acm_validation_options" {
  description = "List of validation options used only with EMAIL validation method. Each object should include 'domain_name' and 'validation_domain'."
  type = list(object({
    domain_name       = string
    validation_domain = string
  }))
  default = []
}

variable "acm_options" {
  description = "List of options to set certificate properties like transparency logging and exportability. Each object must include 'certificate_transparency_logging_preference' and 'export'."
  type = list(object({
    certificate_transparency_logging_preference = string
    export                                      = string
  }))
  default = []
  validation {
    condition = alltrue([
      for o in var.acm_options :
      contains(["ENABLED", "DISABLED"], o.certificate_transparency_logging_preference)
    ])
    error_message = "Each 'certificate_transparency_logging_preference' must be either 'ENABLED' or 'DISABLED'."
  }
}
