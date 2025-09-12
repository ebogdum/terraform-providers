variable "comments" {
  description = "Filter origin access identities by comment"
  type        = list(string)
  default     = null

  validation {
    condition = var.comments == null || (
      can([for comment in var.comments : comment if can(tostring(comment))]) &&
      length(var.comments) > 0
    )
    error_message = "data_aws_cloudfront_origin_access_identities, comments must be a non-empty list of strings when provided."
  }
}