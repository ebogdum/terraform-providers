variable "id" {
  description = "Delegation set ID"
  type        = string

  validation {
    condition     = length(var.id) > 0
    error_message = "data_aws_route53_delegation_set, id must not be empty."
  }
}