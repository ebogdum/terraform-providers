output "arn" {
  description = "ARN of the cost category"
  value       = data.aws_ce_cost_category.this.cost_category_arn
}

output "cost_category_arn" {
  description = "Unique name for the Cost Category"
  value       = data.aws_ce_cost_category.this.cost_category_arn
}

output "default_value" {
  description = "Default value for the cost category"
  value       = data.aws_ce_cost_category.this.default_value
}

output "effective_end" {
  description = "Effective end data of your Cost Category"
  value       = data.aws_ce_cost_category.this.effective_end
}

output "effective_start" {
  description = "Effective state data of your Cost Category"
  value       = data.aws_ce_cost_category.this.effective_start
}

output "id" {
  description = "Unique ID of the cost category"
  value       = data.aws_ce_cost_category.this.id
}

output "rule" {
  description = "Configuration block for the Cost Category rules used to categorize costs"
  value       = data.aws_ce_cost_category.this.rule
}

output "rule_version" {
  description = "Rule schema version in this particular Cost Category"
  value       = data.aws_ce_cost_category.this.rule_version
}

output "split_charge_rule" {
  description = "Configuration block for the split charge rules used to allocate your charges between your Cost Category values"
  value       = data.aws_ce_cost_category.this.split_charge_rule
}

output "tags" {
  description = "Resource tags"
  value       = data.aws_ce_cost_category.this.tags
}