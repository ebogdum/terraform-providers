variable "id" {
  description = "ID of the specific NAT Gateway to retrieve"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "ID of subnet that the NAT Gateway resides in"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ID of the VPC that the NAT Gateway resides in"
  type        = string
  default     = null
}

variable "state" {
  description = "State of the NAT Gateway (pending | failed | available | deleting | deleted)"
  type        = string
  default     = null
  validation {
    condition = var.state == null || contains([
      "pending",
      "failed",
      "available",
      "deleting",
      "deleted"
    ], var.state)
    error_message = "data_aws_nat_gateway, state must be one of: pending, failed, available, deleting, deleted."
  }
}

variable "tags" {
  description = "Map of tags, each pair of which must exactly match a pair on the desired NAT Gateway"
  type        = map(string)
  default     = {}
}

variable "filter" {
  description = "Custom filter blocks for querying NAT Gateways"
  type = list(object({
    name   = string
    values = list(string)
  }))
  default = []
  validation {
    condition = alltrue([
      for filter in var.filter :
      filter.name != null && filter.name != ""
    ])
    error_message = "data_aws_nat_gateway, filter name cannot be null or empty."
  }
  validation {
    condition = alltrue([
      for filter in var.filter :
      length(filter.values) > 0
    ])
    error_message = "data_aws_nat_gateway, filter values cannot be empty."
  }
}

variable "read_timeout" {
  description = "Timeout for read operations"
  type        = string
  default     = "20m"
  validation {
    condition     = can(regex("^[0-9]+[smh]$", var.read_timeout))
    error_message = "data_aws_nat_gateway, read_timeout must be a valid duration (e.g., '20m', '1h', '30s')."
  }
}