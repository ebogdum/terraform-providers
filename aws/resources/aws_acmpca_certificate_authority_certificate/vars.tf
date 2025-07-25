variable "create_certificate_authorities" {
  description = "Controls whether Certificate Authorities should be created."
  type        = bool
  default     = false
}

variable "certificate_authorities" {
  description = "List of Certificate Authority configurations to create. Each object must include type, configuration with key_algorithm, signing_algorithm, and subject with common_name."
  type = list(object({
    type         = string
    configuration = object({
      key_algorithm     = string
      signing_algorithm = string
      subject           = object({
        common_name = string
      })
    })
  }))
  default = []
}

variable "create_certificates" {
  description = "Controls whether ACM PCA certificates should be created."
  type        = bool
  default     = false
}

variable "certificates" {
  description = "List of ACM PCA certificates to create. Each object requires name, certificate_authority_arn, certificate_signing_request, signing_algorithm, template_name, template_version, validity."
  type = list(object({
    name                      = string
    certificate_authority_arn = string
    certificate_signing_request = string
    signing_algorithm         = string
    template_name             = string
    template_version          = string
    validity = object({
      type  = string
      value = number
    })
  }))
  default = []
}

variable "create_certificate_auth_certificates" {
  description = "Controls whether Certificate Authority certificates should be associated."
  type        = bool
  default     = false
}

variable "cert_authority_certificates" {
  description = "List of ACM PCA Certificate Authority Certificate associations. Each object requires name, certificate_authority_arn, certificate, and optionally certificate_chain."
  type = list(object({
    name                      = string
    certificate_authority_arn = string
    certificate               = string
    certificate_chain         = string
  }))
  default = []
}