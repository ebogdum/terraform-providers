variable "enable_account_region" {
  description = "Flag to enable or disable management of AWS account regions. When set to true, the module will manage AWS account region enablement."
  type        = bool
  default     = false
}

variable "account_regions" {
  description = "A list of regions with their enablement settings and optional account IDs to manage across the AWS organization. Each object requires region_name and enabled, with an optional account_id for managing member accounts. Format: [{ region_name = \"ap-southeast-3\", enabled = true, account_id = \"123456789012\" }]."
  type = list(object({
    region_name = string
    enabled     = bool
    account_id  = optional(string)
  }))
  default = []
  validation {
    condition = alltrue([
      for region in var.account_regions : 
      can(regex("^[a-z]{2}-[a-z]+-\d+$", region.region_name))
    ])
    error_message = "Each region_name must be a valid AWS region identifier, such as 'us-west-2'."
  }
}