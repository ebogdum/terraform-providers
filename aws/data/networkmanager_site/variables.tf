variable "global_network_id" {
  description = "ID of the Global Network of the site to retrieve"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.global_network_id))
    error_message = "data_aws_networkmanager_site, global_network_id must be a valid UUID format."
  }
}

variable "site_id" {
  description = "ID of the specific site to retrieve"
  type        = string

  validation {
    condition     = length(var.site_id) > 0
    error_message = "data_aws_networkmanager_site, site_id cannot be empty."
  }
}