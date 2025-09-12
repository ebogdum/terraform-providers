variable "device_id" {
  description = "ID of the device."
  type        = string

  validation {
    condition     = length(var.device_id) > 0
    error_message = "data_aws_networkmanager_device, device_id cannot be empty."
  }
}

variable "global_network_id" {
  description = "ID of the global network."
  type        = string

  validation {
    condition     = length(var.global_network_id) > 0
    error_message = "data_aws_networkmanager_device, global_network_id cannot be empty."
  }
}