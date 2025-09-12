variable "encoding" {
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM."
  type        = string

  validation {
    condition     = contains(["SSH", "PEM"], var.encoding)
    error_message = "data_aws_iam_user_ssh_key, encoding must be either 'SSH' or 'PEM'."
  }
}

variable "ssh_public_key_id" {
  description = "Unique identifier for the SSH public key."
  type        = string

  validation {
    condition     = length(var.ssh_public_key_id) > 0
    error_message = "data_aws_iam_user_ssh_key, ssh_public_key_id must not be empty."
  }
}

variable "username" {
  description = "Name of the IAM user associated with the SSH public key."
  type        = string

  validation {
    condition     = length(var.username) > 0
    error_message = "data_aws_iam_user_ssh_key, username must not be empty."
  }
}