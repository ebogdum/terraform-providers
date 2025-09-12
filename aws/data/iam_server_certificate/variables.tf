variable "name_prefix" {
  description = "Prefix of cert to filter by"
  type        = string
  default     = null

  validation {
    condition     = var.name_prefix == null || can(regex("^[a-zA-Z0-9._-]+$", var.name_prefix))
    error_message = "data_aws_iam_server_certificate, name_prefix must contain only alphanumeric characters, periods, underscores, and hyphens."
  }
}

variable "path_prefix" {
  description = "Prefix of path to filter by"
  type        = string
  default     = null

  validation {
    condition     = var.path_prefix == null || can(regex("^/.*$", var.path_prefix))
    error_message = "data_aws_iam_server_certificate, path_prefix must start with a forward slash (/)."
  }
}

variable "name" {
  description = "Exact name of the cert to lookup"
  type        = string
  default     = null

  validation {
    condition     = var.name == null || can(regex("^[a-zA-Z0-9._-]+$", var.name))
    error_message = "data_aws_iam_server_certificate, name must contain only alphanumeric characters, periods, underscores, and hyphens."
  }
}

variable "latest" {
  description = "Sort results by expiration date. Returns the certificate with expiration date in furthest in the future"
  type        = bool
  default     = false

  validation {
    condition     = can(tobool(var.latest))
    error_message = "data_aws_iam_server_certificate, latest must be a boolean value."
  }
}