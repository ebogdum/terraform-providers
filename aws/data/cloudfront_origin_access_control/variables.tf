variable "id" {
  description = "The identifier for the origin access control settings."
  type        = string

  validation {
    condition     = can(regex("^[A-Z0-9]+$", var.id))
    error_message = "data_aws_cloudfront_origin_access_control, id must be a valid CloudFront origin access control identifier."
  }
}