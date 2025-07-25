variable "create_ami_from_instance" {
  description = "Flag to enable or disable creation of the AMI from an existing EC2 instance. Set to true to create the AMI."
  type        = bool
  default     = false
}

variable "ami_name" {
  description = "Unique name to assign to the AMI. This name must be unique within the region."
  type        = string
  validation {
    condition     = length(var.ami_name) > 0
    error_message = "The AMI name must not be empty."
  }
}

variable "source_instance_id" {
  description = "ID of the EBS-backed EC2 instance to use as the basis for the AMI. Must be a valid EC2 instance ID."
  type        = string
  validation {
    condition     = can(regex("^i-[a-zA-Z0-9]+$", var.source_instance_id))
    error_message = "The source_instance_id must be a valid EC2 instance ID, e.g., i-abc12345."
  }
}

variable "snapshot_without_reboot" {
  description = "If true, the instance will not be stopped before snapshotting. Risk of filesystem inconsistency. Use only if confident no writes will occur during snapshot."
  type        = bool
  default     = false
}

variable "ami_tags" {
  description = "A map of tags to assign to the AMI. These override any provider-level default tags on matching keys."
  type        = map(string)
  default     = {}
}