variable "tags" {
  description = "Restricts the list to the global networks with these tags"
  type        = map(string)
  default     = null

  validation {
    condition     = var.tags == null || can(tomap(var.tags))
    error_message = "data_aws_networkmanager_global_networks, tags must be a valid map of strings."
  }
}