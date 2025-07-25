output "accessanalyzer_archive_rule_id" {
  description = "The ID of the Access Analyzer Archive Rule in the format: analyzer_name/rule_name."
  value       = aws_accessanalyzer_archive_rule.aws_accessanalyzer_archive_rule[0].id
  sensitive   = false
}

output "accessanalyzer_archive_rule_name" {
  description = "The name of the Access Analyzer Archive Rule."
  value       = aws_accessanalyzer_archive_rule.aws_accessanalyzer_archive_rule[0].rule_name
  sensitive   = false
}