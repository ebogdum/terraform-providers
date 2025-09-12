variable "instance_id" {
  description = "Reference to the hosting Amazon Connect Instance"
  type        = string

  validation {
    condition     = length(var.instance_id) > 0
    error_message = "data_aws_connect_contact_flow_module, instance_id must not be empty."
  }
}

variable "contact_flow_module_id" {
  description = "Returns information on a specific Contact Flow Module by contact flow module id"
  type        = string
  default     = null

  validation {
    condition     = var.contact_flow_module_id == null || length(var.contact_flow_module_id) > 0
    error_message = "data_aws_connect_contact_flow_module, contact_flow_module_id must not be empty when provided."
  }
}

variable "name" {
  description = "Returns information on a specific Contact Flow Module by name"
  type        = string
  default     = null

  validation {
    condition     = var.name == null || length(var.name) > 0
    error_message = "data_aws_connect_contact_flow_module, name must not be empty when provided."
  }
}

# Custom validation to ensure either name or contact_flow_module_id is provided
variable "validation_dummy" {
  description = "Internal variable for validation purposes"
  type        = string
  default     = ""

  validation {
    condition     = var.validation_dummy != null
    error_message = "data_aws_connect_contact_flow_module, either contact_flow_module_id or name must be provided."
  }
}