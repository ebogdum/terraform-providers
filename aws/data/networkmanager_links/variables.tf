variable "global_network_id" {
  description = "ID of the Global Network of the links to retrieve"
  type        = string

  validation {
    condition     = length(var.global_network_id) > 0
    error_message = "data_aws_networkmanager_links, global_network_id must not be empty."
  }
}

variable "provider_name" {
  description = "Link provider to retrieve"
  type        = string
  default     = null
}

variable "site_id" {
  description = "ID of the site of the links to retrieve"
  type        = string
  default     = null
}

variable "tags" {
  description = "Restricts the list to the links with these tags"
  type        = map(string)
  default     = null
}

variable "type" {
  description = "Link type to retrieve"
  type        = string
  default     = null
}