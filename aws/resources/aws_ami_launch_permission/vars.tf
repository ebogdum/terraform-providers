variable "create_ami_launch_permission" {
  description = "Boolean flag to control whether AMI launch permissions should be created."
  type        = bool
  default     = false
}

variable "enable_organization_access" {
  description = "Whether to enable organization-wide access using the ARN from the current AWS Organization. If true, the data source aws_organizations_organization will be evaluated for use in launch permissions."
  type        = bool
  default     = false
}

variable "ami_launch_permissions" {
  description = "A map of AMI launch permission configurations keyed by a unique name. Each object may contain keys: image_id (required), account_id, group, organization_arn, organizational_unit_arn. If enable_organization_access is true and organization_arn is not provided, it will use the active organization's ARN. Example: { permission1 = { image_id = \"ami-123\", account_id = \"123456789012\" }, permission2 = { image_id = \"ami-456\", group = \"all\" } }"
  type = map(object({
    image_id                = string
    account_id              = optional(string)
    group                   = optional(string)
    organization_arn        = optional(string)
    organizational_unit_arn = optional(string)
  }))
  default = {}

  validation {
    condition = alltrue([
      for k, v in var.ami_launch_permissions : can(regex("^ami-[a-f0-9]+$", v.image_id))
    ])
    error_message = "Each launch permission entry must contain a valid AMI ID in the format 'ami-xxxxxxxxxxxxxxxxx'."
  }
}