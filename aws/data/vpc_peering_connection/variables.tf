variable "id" {
  description = "ID of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
}

variable "status" {
  description = "Status of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition = var.status == null || contains([
      "initiating-request",
      "pending-acceptance",
      "active",
      "deleted",
      "rejected",
      "failed",
      "expired",
      "provisioning",
      "deleting"
    ], var.status)
    error_message = "data_aws_vpc_peering_connection, status must be one of: initiating-request, pending-acceptance, active, deleted, rejected, failed, expired, provisioning, deleting."
  }
}

variable "vpc_id" {
  description = "ID of the requester VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.vpc_id == null || can(regex("^vpc-[0-9a-f]{8}([0-9a-f]{9})?$", var.vpc_id))
    error_message = "data_aws_vpc_peering_connection, vpc_id must be a valid VPC ID format (vpc-xxxxxxxx or vpc-xxxxxxxxxxxxxxxxx)."
  }
}

variable "owner_id" {
  description = "AWS account ID of the owner of the requester VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.owner_id == null || can(regex("^[0-9]{12}$", var.owner_id))
    error_message = "data_aws_vpc_peering_connection, owner_id must be a valid 12-digit AWS account ID."
  }
}

variable "cidr_block" {
  description = "Primary CIDR block of the requester VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.cidr_block == null || can(cidrhost(var.cidr_block, 0))
    error_message = "data_aws_vpc_peering_connection, cidr_block must be a valid CIDR block."
  }
}

variable "peer_vpc_id" {
  description = "ID of the accepter VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.peer_vpc_id == null || can(regex("^vpc-[0-9a-f]{8}([0-9a-f]{9})?$", var.peer_vpc_id))
    error_message = "data_aws_vpc_peering_connection, peer_vpc_id must be a valid VPC ID format (vpc-xxxxxxxx or vpc-xxxxxxxxxxxxxxxxx)."
  }
}

variable "peer_owner_id" {
  description = "AWS account ID of the owner of the accepter VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.peer_owner_id == null || can(regex("^[0-9]{12}$", var.peer_owner_id))
    error_message = "data_aws_vpc_peering_connection, peer_owner_id must be a valid 12-digit AWS account ID."
  }
}

variable "peer_cidr_block" {
  description = "Primary CIDR block of the accepter VPC of the specific VPC Peering Connection to retrieve"
  type        = string
  default     = null
  validation {
    condition     = var.peer_cidr_block == null || can(cidrhost(var.peer_cidr_block, 0))
    error_message = "data_aws_vpc_peering_connection, peer_cidr_block must be a valid CIDR block."
  }
}

variable "filter" {
  description = "Custom filter block"
  type = list(object({
    name   = string
    values = set(string)
  }))
  default = []
  validation {
    condition = alltrue([
      for f in var.filter : f.name != "" && length(f.values) > 0
    ])
    error_message = "data_aws_vpc_peering_connection, filter name cannot be empty and values must contain at least one element."
  }
}

variable "tags" {
  description = "Map of tags, each pair of which must exactly match a pair on the desired VPC Peering Connection"
  type        = map(string)
  default     = {}
}

variable "read_timeout" {
  description = "Read timeout for the data source"
  type        = string
  default     = "20m"
  validation {
    condition     = can(regex("^[0-9]+[smh]$", var.read_timeout))
    error_message = "data_aws_vpc_peering_connection, read_timeout must be a valid duration format (e.g., 20m, 1h, 30s)."
  }
}