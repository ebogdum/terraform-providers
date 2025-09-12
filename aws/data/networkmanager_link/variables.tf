variable "global_network_id" {
  description = "ID of the Global Network of the link to retrieve"
  type        = string

  validation {
    condition     = length(var.global_network_id) > 0
    error_message = "data_aws_networkmanager_link, global_network_id must not be empty."
  }
}

variable "link_id" {
  description = "ID of the specific link to retrieve"
  type        = string

  validation {
    condition     = length(var.link_id) > 0
    error_message = "data_aws_networkmanager_link, link_id must not be empty."
  }
}