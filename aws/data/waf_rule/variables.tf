variable "name" {
  description = "Name of the WAF rule"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_waf_rule, name must not be empty."
  }
}