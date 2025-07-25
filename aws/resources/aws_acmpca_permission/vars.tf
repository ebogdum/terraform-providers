variable "create_certificate_authority" {
  description = "Indicates whether to create a new ACM Private Certificate Authority. Set to false if using an existing CA."
  type        = bool
  default     = true
}

variable "certificate_authority_configuration" {
  description = "Configuration block for the ACM Private Certificate Authority to be created."
  type = object({
    key_algorithm     = string
    signing_algorithm = string
    subject = object({
      common_name = string
    })
  })
  default = {
    key_algorithm     = "RSA_4096"
    signing_algorithm = "SHA512WITHRSA"
    subject = {
      common_name = "example.com"
    }
  }
}

variable "external_certificate_authority_arn" {
  description = "The ARN of an existing ACM Private Certificate Authority when create_certificate_authority is false. Required if not creating a new CA."
  type        = string
  default     = ""
  validation {
    condition     = var.create_certificate_authority || (length(var.external_certificate_authority_arn) > 0)
    error_message = "If create_certificate_authority is false, external_certificate_authority_arn must be provided."
  }
}

variable "create_acmpca_permission" {
  description = "Whether to create the ACM PCA permission resource."
  type        = bool
  default     = true
}

variable "actions" {
  description = "List of actions that the specified AWS service principal can use. Must include 'IssueCertificate', 'GetCertificate', and 'ListPermissions' for ACM via PCA integration."
  type        = list(string)
  default     = [
    "IssueCertificate",
    "GetCertificate",
    "ListPermissions"
  ]
  validation {
    condition     = alltrue([for action in ["IssueCertificate", "GetCertificate", "ListPermissions"] : contains(var.actions, action)])
    error_message = "actions must include 'IssueCertificate', 'GetCertificate', and 'ListPermissions'."
  }
}

variable "principal" {
  description = "The AWS service principal to which the permission applies. Currently, only 'acm.amazonaws.com' is valid."
  type        = string
  default     = "acm.amazonaws.com"
  validation {
    condition     = var.principal == "acm.amazonaws.com"
    error_message = "Only 'acm.amazonaws.com' is a supported principal."
  }
}

variable "source_account" {
  description = "Optional ID of the calling account. Useful in cross-account scenarios."
  type        = string
  default     = ""
}