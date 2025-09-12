variable "route_table_id" {
  description = "ID of the specific Route Table containing the Route entry"
  type        = string

  validation {
    condition     = can(regex("^rtb-[0-9a-f]{8,17}$", var.route_table_id))
    error_message = "data_aws_route, route_table_id must be a valid Route Table ID starting with 'rtb-'."
  }
}

variable "carrier_gateway_id" {
  description = "EC2 Carrier Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.carrier_gateway_id == null || can(regex("^cagw-[0-9a-f]{8,17}$", var.carrier_gateway_id))
    error_message = "data_aws_route, carrier_gateway_id must be a valid Carrier Gateway ID starting with 'cagw-' or null."
  }
}

variable "core_network_arn" {
  description = "Core network ARN of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.core_network_arn == null || can(regex("^arn:aws:networkmanager::", var.core_network_arn))
    error_message = "data_aws_route, core_network_arn must be a valid ARN starting with 'arn:aws:networkmanager::' or null."
  }
}

variable "destination_cidr_block" {
  description = "CIDR block of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.destination_cidr_block == null || can(cidrhost(var.destination_cidr_block, 0))
    error_message = "data_aws_route, destination_cidr_block must be a valid CIDR block or null."
  }
}

variable "destination_ipv6_cidr_block" {
  description = "IPv6 CIDR block of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.destination_ipv6_cidr_block == null || can(regex("^[0-9a-fA-F:]+/[0-9]+$", var.destination_ipv6_cidr_block))
    error_message = "data_aws_route, destination_ipv6_cidr_block must be a valid IPv6 CIDR block or null."
  }
}

variable "destination_prefix_list_id" {
  description = "ID of a managed prefix list destination of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.destination_prefix_list_id == null || can(regex("^pl-[0-9a-f]{8,17}$", var.destination_prefix_list_id))
    error_message = "data_aws_route, destination_prefix_list_id must be a valid Prefix List ID starting with 'pl-' or null."
  }
}

variable "egress_only_gateway_id" {
  description = "Egress Only Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.egress_only_gateway_id == null || can(regex("^eigw-[0-9a-f]{8,17}$", var.egress_only_gateway_id))
    error_message = "data_aws_route, egress_only_gateway_id must be a valid Egress Only Gateway ID starting with 'eigw-' or null."
  }
}

variable "gateway_id" {
  description = "Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.gateway_id == null || can(regex("^(igw|vgw|nat)-[0-9a-f]{8,17}$", var.gateway_id))
    error_message = "data_aws_route, gateway_id must be a valid Gateway ID starting with 'igw-', 'vgw-', or 'nat-' or null."
  }
}

variable "instance_id" {
  description = "Instance ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.instance_id == null || can(regex("^i-[0-9a-f]{8,17}$", var.instance_id))
    error_message = "data_aws_route, instance_id must be a valid Instance ID starting with 'i-' or null."
  }
}

variable "local_gateway_id" {
  description = "Local Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.local_gateway_id == null || can(regex("^lgw-[0-9a-f]{8,17}$", var.local_gateway_id))
    error_message = "data_aws_route, local_gateway_id must be a valid Local Gateway ID starting with 'lgw-' or null."
  }
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.nat_gateway_id == null || can(regex("^nat-[0-9a-f]{8,17}$", var.nat_gateway_id))
    error_message = "data_aws_route, nat_gateway_id must be a valid NAT Gateway ID starting with 'nat-' or null."
  }
}

variable "network_interface_id" {
  description = "Network Interface ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.network_interface_id == null || can(regex("^eni-[0-9a-f]{8,17}$", var.network_interface_id))
    error_message = "data_aws_route, network_interface_id must be a valid Network Interface ID starting with 'eni-' or null."
  }
}

variable "transit_gateway_id" {
  description = "EC2 Transit Gateway ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.transit_gateway_id == null || can(regex("^tgw-[0-9a-f]{8,17}$", var.transit_gateway_id))
    error_message = "data_aws_route, transit_gateway_id must be a valid Transit Gateway ID starting with 'tgw-' or null."
  }
}

variable "vpc_peering_connection_id" {
  description = "VPC Peering Connection ID of the Route belonging to the Route Table"
  type        = string
  default     = null

  validation {
    condition     = var.vpc_peering_connection_id == null || can(regex("^pcx-[0-9a-f]{8,17}$", var.vpc_peering_connection_id))
    error_message = "data_aws_route, vpc_peering_connection_id must be a valid VPC Peering Connection ID starting with 'pcx-' or null."
  }
}

variable "timeouts" {
  description = "Configuration options for timeouts"
  type = object({
    read = optional(string, "20m")
  })
  default = null

  validation {
    condition     = var.timeouts == null || can(regex("^[0-9]+[smh]$", var.timeouts.read))
    error_message = "data_aws_route, timeouts.read must be a valid duration string (e.g., '20m', '1h', '30s') or null."
  }
}