variable "create_api_gateway_api_key" {
  description = "Flag to enable or disable creation of API Gateway API key resources."
  type        = bool
  default     = false
}

variable "api_keys" {
  description = "List of API Gateway API key definitions. Each object should include name, optional customer_id, description, enabled flag, value, and tags. Example: [{ name = \"example\", description = \"My key\", enabled = true, value = \"<generated_or_manual_key>\", tags = { Environment = \"prod\" }}]"
  type = list(object({
    name        = string
    customer_id = optional(string)
    description = optional(string, "Managed by Terraform")
    enabled     = optional(bool, true)
    value = optional(string)
    tags  = optional(map(string), {})
  }))
  default = []

  validation {
    condition = alltrue([
      for item in var.api_keys : (
        item.value == null || (length(item.value) >= 20 && length(item.value) <= 128 && can(regex("^[A-Za-z0-9]+$", item.value)))
      )
    ])
    error_message = "If provided, each API key value must be alphanumeric and between 20 and 128 characters."
  }
}
