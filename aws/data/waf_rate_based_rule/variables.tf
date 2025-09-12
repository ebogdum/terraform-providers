variable "name" {
  type        = string
  description = "Name of the WAF rate based rule"

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_waf_rate_based_rule, name must not be empty."
  }
}