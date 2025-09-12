variable "global_network_id" {
  type        = string
  description = "ID of the Global Network of the connection to retrieve"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.global_network_id))
    error_message = "data_aws_networkmanager_connection, global_network_id must be a valid global network ID containing only alphanumeric characters and hyphens."
  }

  validation {
    condition     = length(var.global_network_id) > 0
    error_message = "data_aws_networkmanager_connection, global_network_id cannot be empty."
  }
}

variable "connection_id" {
  type        = string
  description = "ID of the specific connection to retrieve"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.connection_id))
    error_message = "data_aws_networkmanager_connection, connection_id must be a valid connection ID containing only alphanumeric characters and hyphens."
  }

  validation {
    condition     = length(var.connection_id) > 0
    error_message = "data_aws_networkmanager_connection, connection_id cannot be empty."
  }
}