variable "name" {
  description = "Name of the WAF Web ACL"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_-]+$", var.name))
    error_message = "data_aws_waf_web_acl, name must contain only alphanumeric characters, hyphens, and underscores."
  }

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 128
    error_message = "data_aws_waf_web_acl, name must be between 1 and 128 characters long."
  }
}