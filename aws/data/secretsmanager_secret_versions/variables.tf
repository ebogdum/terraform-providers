variable "secret_id" {
  description = "Specifies the secret containing the version that you want to retrieve. You can specify either the ARN or the friendly name of the secret."
  type        = string

  validation {
    condition     = length(var.secret_id) > 0
    error_message = "data_aws_secretsmanager_secret_version, secret_id must not be empty."
  }
}
