variable "create_certificate_validation" {
  description = "Whether to create the ACM certificate validation resource. Must be true to proceed with validation."
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "The main domain name for the ACM certificate (e.g., 'example.com')."
  type        = string
  validation {
    condition     = length(var.domain_name) > 0
    error_message = "The domain_name must not be an empty string."
  }
}

variable "subject_alternative_names" {
  description = "A list of additional domain names to be included in the subject alternative name extension of the ACM certificate. For example: ['www.example.com', 'api.example.com']"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "The validation method for the ACM certificate. Allowed values are 'DNS' or 'EMAIL'. DNS is recommended."
  type        = string
  default     = "DNS"
  validation {
    condition     = var.validation_method == "DNS" || var.validation_method == "EMAIL"
    error_message = "validation_method must be either 'DNS' or 'EMAIL'."
  }
}

variable "route53_zones" {
  description = "A map of Route 53 zone names to zone configuration. Each value must be an object with a 'private_zone' key, e.g., { 'example.com' = { private_zone = false } }"
  type = map(object({
    private_zone = bool
  }))
}

variable "domain_zone_map" {
  description = "A map that assigns each domain name in the certificate to its corresponding Route 53 hosted zone ID. Example: { 'example.com' = 'Z1234567890ABCDEFG' }"
  type        = map(string)
  validation {
    condition     = length(var.domain_zone_map) > 0
    error_message = "domain_zone_map must contain at least one domain to zone ID mapping."
  }
}