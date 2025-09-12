variable "global_network_id" {
  description = "ID of the Global Network of the devices to retrieve"
  type        = string

  validation {
    condition     = can(regex("^gn-[0-9a-f]{17}$", var.global_network_id))
    error_message = "data_aws_networkmanager_devices, global_network_id must be a valid Global Network ID starting with 'gn-' followed by 17 hexadecimal characters."
  }
}

variable "site_id" {
  description = "ID of the site of the devices to retrieve"
  type        = string
  default     = null

  validation {
    condition     = var.site_id == null || can(regex("^site-[0-9a-f]{17}$", var.site_id))
    error_message = "data_aws_networkmanager_devices, site_id must be null or a valid Site ID starting with 'site-' followed by 17 hexadecimal characters."
  }
}

variable "tags" {
  description = "Restricts the list to the devices with these tags"
  type        = map(string)
  default     = {}

  validation {
    condition     = can(var.tags)
    error_message = "data_aws_networkmanager_devices, tags must be a valid map of strings."
  }
}