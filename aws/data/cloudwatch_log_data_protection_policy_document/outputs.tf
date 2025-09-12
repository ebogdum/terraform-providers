output "json" {
  description = "Standard JSON policy document rendered based on the arguments above"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.json
}

output "name" {
  description = "The name of the data protection policy document"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.name
}

output "description" {
  description = "Description of the data protection policy document"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.description
}

output "version" {
  description = "Version of the data protection policy document"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.version
}

output "statement" {
  description = "Configures the data protection policy"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.statement
}

output "configuration" {
  description = "Configuration block for custom data identifiers"
  value       = data.aws_cloudwatch_log_data_protection_policy_document.this.configuration
}