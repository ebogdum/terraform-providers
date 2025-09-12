variable "device_id" {
  description = "ID of the device of the connections to retrieve"
  type        = string
  default     = null

  validation {
    condition     = var.device_id == null || can(regex("^[a-zA-Z0-9-]+$", var.device_id))
    error_message = "data_aws_networkmanager_connections, device_id must be a valid device ID containing only alphanumeric characters and hyphens."
  }
}

variable "global_network_id" {
  description = "ID of the Global Network of the connections to retrieve"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+$", var.global_network_id))
    error_message = "data_aws_networkmanager_connections, global_network_id must be a valid global network ID containing only alphanumeric characters and hyphens."
  }
}

variable "tags" {
  description = "Restricts the list to the connections with these tags"
  type        = map(string)
  default     = null

  validation {
    condition     = var.tags == null || can(keys(var.tags))
    error_message = "data_aws_networkmanager_connections, tags must be a valid map of strings."
  }
}