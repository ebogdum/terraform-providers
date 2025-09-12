variable "name" {
  description = "Name of the WAF IP set"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_waf_ipset, name must not be empty."
  }
}