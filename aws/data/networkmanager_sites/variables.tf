variable "global_network_id" {
  description = "ID of the Global Network of the sites to retrieve"
  type        = string

  validation {
    condition     = can(regex("^gn-[0-9a-f]{17}$", var.global_network_id))
    error_message = "data_aws_networkmanager_sites, global_network_id must be a valid Global Network ID format (gn- followed by 17 hexadecimal characters)."
  }
}

variable "tags" {
  description = "Restricts the list to the sites with these tags"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for k, v in var.tags : can(regex("^[\\w\\s\\+\\-\\=\\._:\\/@]+$", k)) && can(regex("^[\\w\\s\\+\\-\\=\\._:\\/@]*$", v))
    ])
    error_message = "data_aws_networkmanager_sites, tags keys and values must contain only valid characters (letters, numbers, spaces, and the following special characters: + - = . _ : / @)."
  }
}