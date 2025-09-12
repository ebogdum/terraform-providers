variable "secrets" {
  description = "One or more encrypted payload definitions from the KMS service"
  type = list(object({
    name                 = string
    payload              = string
    context              = optional(map(string))
    grant_tokens         = optional(list(string))
    encryption_algorithm = optional(string)
    key_id               = optional(string)
  }))

  validation {
    condition     = length(var.secrets) > 0
    error_message = "data_aws_kms_secrets, secrets must contain at least one secret definition."
  }

  validation {
    condition = alltrue([
      for secret in var.secrets : secret.name != null && secret.name != ""
    ])
    error_message = "data_aws_kms_secrets, name is required and cannot be empty for each secret."
  }

  validation {
    condition = alltrue([
      for secret in var.secrets : secret.payload != null && secret.payload != ""
    ])
    error_message = "data_aws_kms_secrets, payload is required and cannot be empty for each secret."
  }

  validation {
    condition = alltrue([
      for secret in var.secrets :
      secret.encryption_algorithm == null || contains([
        "SYMMETRIC_DEFAULT",
        "RSAES_OAEP_SHA_1",
        "RSAES_OAEP_SHA_256",
        "SM2PKE"
      ], secret.encryption_algorithm)
    ])
    error_message = "data_aws_kms_secrets, encryption_algorithm must be one of: SYMMETRIC_DEFAULT, RSAES_OAEP_SHA_1, RSAES_OAEP_SHA_256, SM2PKE."
  }
}