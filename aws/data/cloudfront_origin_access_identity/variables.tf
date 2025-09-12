variable "id" {
  description = "The identifier for the origin access identity. For example: E1ZAKK699EOLAL"
  type        = string

  validation {
    condition     = length(var.id) > 0
    error_message = "data_aws_cloudfront_origin_access_identity, id must be a non-empty string."
  }
}