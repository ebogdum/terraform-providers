variable "arn" {
  description = "ARN for an assumed role"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:.*", var.arn))
    error_message = "data_aws_iam_session_context, arn must be a valid AWS ARN starting with 'arn:aws:'."
  }
}