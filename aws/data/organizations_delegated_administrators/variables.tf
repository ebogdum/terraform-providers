variable "service_principal" {
  description = "Specifies a service principal name. If specified, then the operation lists the delegated administrators only for the specified service. If you don't specify a service principal, the operation lists all delegated administrators for all services in your organization."
  type        = string
  default     = null

  validation {
    condition     = var.service_principal == null ? true : can(regex("^[a-zA-Z0-9._-]+$", var.service_principal))
    error_message = "data_aws_organizations_delegated_administrators, service_principal must be a valid service principal name containing only alphanumeric characters, dots, hyphens, and underscores."
  }
}