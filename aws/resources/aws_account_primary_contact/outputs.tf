output "access_analyzer_arn" {
  description = "The ARN of the AWS Access Analyzer. Useful for referencing the analyzer in permissions or other AWS resources."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].arn
}

output "access_analyzer_name" {
  description = "The name of the AWS Access Analyzer. Can be used to identify or import the resource."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].id
}

output "access_analyzer_tags_all" {
  description = "All the tags assigned to the Access Analyzer, including those inherited from the provider default_tags."
  value       = aws_accessanalyzer_analyzer.aws_accessanalyzer_analyzer[0].tags_all
}