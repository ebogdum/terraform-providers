variable "create_acmpca_policy" {
  description = "Flag to enable or disable creation of ACM PCA policy. Set to true to create the resource."
  type        = bool
  default     = false
}

variable "certificate_authority_arn" {
  description = "The ARN of the AWS Certificate Manager Private Certificate Authority to which the policy will be attached. Example: arn:aws:acm-pca:us-east-1:123456789012:certificate-authority/abcd1234-5678-90ef-ghij-klmnopqrstuv"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:acm-pca:[^:]+:[0-9]{12}:certificate-authority/[a-f0-9-]+$", var.certificate_authority_arn))
    error_message = "The certificate_authority_arn must be a valid ACM PCA certificate authority ARN."
  }
}

variable "certificate_template_arn" {
  description = "The ARN of the template to restrict the IssueCertificate action. Example: arn:aws:acm-pca:::template/EndEntityCertificate/V1"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:acm-pca:::+template/[A-Za-z0-9_/.-]+$", var.certificate_template_arn))
    error_message = "The certificate_template_arn must be a valid ACM PCA template ARN."
  }
}