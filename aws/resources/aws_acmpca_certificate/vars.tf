variable "create_acmpca_certificate" {
  description = "Controls whether the ACM PCA certificate resource is created"
  type        = bool
  default     = true
}

variable "certificate_authority_arn" {
  description = "ARN of the AWS Certificate Manager Private Certificate Authority used to issue the certificate"
  type        = string
  validation {
    condition     = startswith(var.certificate_authority_arn, "arn:aws:acm-pca:")
    error_message = "The certificate_authority_arn must be a valid ACM PCA ARN."
  }
}

variable "certificate_signing_request" {
  description = "Certificate Signing Request in PEM format to issue the certificate"
  type        = string
}

variable "signing_algorithm" {
  description = "Algorithm used to sign the certificate request. Valid values: SHA256WITHRSA, SHA256WITHECDSA, SHA384WITHRSA, SHA384WITHECDSA, SHA512WITHRSA, SHA512WITHECDSA"
  type        = string
  validation {
    condition = contains([
      "SHA256WITHRSA",
      "SHA256WITHECDSA",
      "SHA384WITHRSA",
      "SHA384WITHECDSA",
      "SHA512WITHRSA",
      "SHA512WITHECDSA"
    ], var.signing_algorithm)
    error_message = "Invalid signing algorithm provided."
  }
}

variable "template_arn" {
  description = "Optional ARN of the template to use when issuing the certificate. See ACM PCA Documentation for valid templates."
  type        = string
  default     = null
}

variable "validity" {
  description = "Specifies the validity period for the certificate. Object must contain 'type' and 'value'. For example: { type = \"YEARS\", value = 1 }"
  type = object({
    type  = string
    value = number
  })
  validation {
    condition     = contains(["DAYS", "MONTHS", "YEARS", "ABSOLUTE", "END_DATE"], var.validity.type)
    error_message = "validity.type must be one of DAYS, MONTHS, YEARS, ABSOLUTE, or END_DATE."
  }
}

variable "create_tls_resources" {
  description = "Controls whether to create the TLS private key and CSR generation resources"
  type        = bool
  default     = true
}

variable "private_key_algorithm" {
  description = "Algorithm for the TLS private key. Valid values: RSA, ECDSA"
  type        = string
  default     = "RSA"
  validation {
    condition     = contains(["RSA", "ECDSA"], var.private_key_algorithm)
    error_message = "private_key_algorithm must be either 'RSA' or 'ECDSA'."
  }
}

variable "csr_common_name" {
  description = "Common name to include in the CSR (e.g., 'example.com')"
  type        = string
  default     = "example"
}