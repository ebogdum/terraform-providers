variable "arn" {
  description = "ARN assigned by AWS for the provider."
  type        = string

  validation {
    condition     = can(regex("^arn:aws:iam::[0-9]{12}:saml-provider/.+", var.arn))
    error_message = "data_aws_iam_saml_provider, arn must be a valid IAM SAML provider ARN in the format 'arn:aws:iam::123456789012:saml-provider/provider-name'."
  }
}