variable "create_aws_ami" {
  description = "Whether to create the AWS AMI resource. Set to true to enable creation."
  type        = bool
}

variable "ami_name" {
  description = "A region-unique name for the AMI. Example: 'my-custom-ami-20240401'."
  type        = string
}

variable "virtualization_type" {
  description = "The virtualization mode to use for instances launched from the AMI. Valid values: 'hvm', 'paravirtual'."
  type        = string
  validation {
    condition     = can(regex("^(hvm|paravirtual)$", var.virtualization_type))
    error_message = "Virtualization type must be either 'hvm' or 'paravirtual'."
  }
}

variable "root_device_name" {
  description = "The name of the root device. Example: '/dev/xvda'."
  type        = string
}

variable "architecture" {
  description = "Machine architecture for created instances. Example: 'x86_64', 'arm64'."
  type        = string
  default     = "x86_64"
  validation {
    condition     = contains(["x86_64", "arm64"], var.architecture)
    error_message = "Architecture must be 'x86_64' or 'arm64'."
  }
}

variable "boot_mode" {
  description = "The boot mode of the AMI. Valid values: 'legacy-bios', 'uefi', 'uefi-preferred'. Optional setting."
  type        = string
  default     = null
}

variable "deprecation_time" {
  description = "RFC3339 timestamp for when the AMI should be deprecated. Example: '2024-12-31T00:00:00Z'."
  type        = string
  default     = null
  validation {
    condition     = var.deprecation_time == null || can(regex("^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}Z$", var.deprecation_time))
    error_message = "Deprecation time must be a valid RFC3339 datetime string."
  }
}

variable "description" {
  description = "Human-readable description of the AMI."
  type        = string
  default     = null
}

variable "ena_support" {
  description = "Whether enhanced networking with ENA is enabled."
  type        = bool
  default     = false
}

variable "imds_support" {
  description = "If EC2 instances launched from this image must use IMDSv2, set this to 'v2.0'."
  type        = string
  default     = null
  validation {
    condition     = var.imds_support == null || var.imds_support == "v2.0"
    error_message = "IMDS support must be null or 'v2.0'."
  }
}

variable "sriov_net_support" {
  description = "Whether enhanced networking is enabled. Valid value: 'simple'. Applies to HVM virtualization."
  type        = string
  default     = null
  validation {
    condition     = var.sriov_net_support == null || var.sriov_net_support == "simple"
    error_message = "Sriov net support must be 'simple' or null."
  }
}

variable "tpm_support" {
  description = "If the AMI is configured for NitroTPM support, the value must be 'v2.0'."
  type        = string
  default     = null
  validation {
    condition     = var.tpm_support == null || var.tpm_support == "v2.0"
    error_message = "TPM support must be null or 'v2.0'."
  }
}

variable "uefi_data" {
  description = "Base64-encoded UEFI non-volatile variable store data. Optional."
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to assign to the AMI resource. Example: { Environment = 'production', Owner = 'DevOps' }"
  type        = map(string)
  default     = {}
}

variable "ebs_block_devices" {
  description = "List of EBS block device configurations to attach to the AMI."
  type = list(object({
    device_name           = string
    snapshot_id           = optional(string)
    volume_size           = optional(number)
    volume_type           = optional(string, "standard")
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool)
    iops                  = optional(number)
    throughput            = optional(number)
    outpost_arn           = optional(string)
  }))
  default = []
}

variable "ephemeral_block_devices" {
  description = "List of ephemeral block device configurations to attach to the AMI."
  type = list(object({
    device_name  = string
    virtual_name = string
  }))
  default = []
}