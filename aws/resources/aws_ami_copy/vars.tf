variable "create_ami_copy" {
  description = "Determines whether the AMI copy resource should be created. Set to true to enable creation."
  type        = bool
}

variable "ami_name" {
  description = "Region-unique name for the copied AMI. This name will be used to identify the destination AMI."
  type        = string
  validation {
    condition     = length(var.ami_name) > 0
    error_message = "The AMI name must not be empty."
  }
}

variable "source_ami_id" {
  description = "The ID of the source AMI that should be copied. Must exist in the region specified by 'source_ami_region'."
  type        = string
  validation {
    condition     = can(regex("^ami-[a-f0-9]+$", var.source_ami_id))
    error_message = "The source AMI ID must be a valid AMI ID starting with 'ami-'."
  }
}

variable "source_ami_region" {
  description = "The AWS region from which the source AMI will be copied. This must be the region where the source AMI resides."
  type        = string
  validation {
    condition     = length(var.source_ami_region) > 0
    error_message = "Source AMI region must not be empty."
  }
}

variable "destination_outpost_arn" {
  description = "Optional ARN of the Outpost to which to copy the AMI. Required only for AMI copies to an AWS Outpost."
  type        = string
  default     = null
}

variable "encrypted" {
  description = "Whether the destination snapshots of the copied image should be encrypted. Defaults to false."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "Full ARN of the KMS Key to use when encrypting the snapshots of the AMI copy. If not provided, the AWS default KMS key will be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the copied AMI. These can override provider-level default tags."
  type        = map(string)
  default     = {}
}