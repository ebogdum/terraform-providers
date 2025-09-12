variable "name" {
  description = "Unique name to identify the origin request policy."
  type        = string
  default     = null

  validation {
    condition     = var.name != null || var.id != null
    error_message = "data_aws_cloudfront_origin_request_policy, name or id must be provided."
  }
}

variable "id" {
  description = "Identifier for the origin request policy."
  type        = string
  default     = null
}