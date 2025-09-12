variable "region" {
  description = "Region where this resource will be managed. Defaults to the Region set in the provider configuration."
  type        = string
  default     = null
}

variable "package_name" {
  description = "Unique name for the package."
  type        = string

  validation {
    condition     = length(var.package_name) > 0
    error_message = "resource_aws_opensearch_package, package_name must not be empty."
  }
}

variable "package_type" {
  description = "The type of package."
  type        = string

  validation {
    condition     = length(var.package_type) > 0
    error_message = "resource_aws_opensearch_package, package_type must not be empty."
  }
}

variable "package_source" {
  description = "Configuration block for the package source options."
  type = object({
    s3_bucket_name = string
    s3_key         = string
  })

  validation {
    condition     = length(var.package_source.s3_bucket_name) > 0
    error_message = "resource_aws_opensearch_package, s3_bucket_name must not be empty."
  }

  validation {
    condition     = length(var.package_source.s3_key) > 0
    error_message = "resource_aws_opensearch_package, s3_key must not be empty."
  }
}

variable "package_description" {
  description = "Description of the package."
  type        = string
  default     = null
}