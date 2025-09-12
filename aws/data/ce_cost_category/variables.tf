variable "cost_category_arn" {
  description = "Unique name for the Cost Category"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:ce:.*:.*:costcategory/.*", var.cost_category_arn))
    error_message = "data_ce_cost_category, cost_category_arn must be a valid Cost Category ARN."
  }
}