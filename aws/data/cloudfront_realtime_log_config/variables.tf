variable "name" {
  description = "Unique name to identify this real-time log configuration"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "data_aws_cloudfront_realtime_log_config, name must not be empty."
  }
}