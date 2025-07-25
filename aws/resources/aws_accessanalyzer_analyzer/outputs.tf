output "access_analyzer_arn" {
  description = "The ARN of the created Access Analyzer."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].arn
}

output "access_analyzer_id" {
  description = "The name (ID) of the created Access Analyzer."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].id
}

output "access_analyzer_tags_all" {
  description = "All tags associated with the Access Analyzer, including inherited tags."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].tags_all
}