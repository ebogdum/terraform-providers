variable "id" {
  description = "Identifier for the distribution. For example: EDFDVBD632BHDS5."
  type        = string

  validation {
    condition     = length(var.id) > 0
    error_message = "data_aws_cloudfront_distribution, id must be a non-empty string."
  }
}