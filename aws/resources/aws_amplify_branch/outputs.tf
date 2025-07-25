output "amplify_app_id" {
  description = "ID of the Amplify app."
  value       = aws_amplify_app.aws_amplify_app[0].id
}

output "amplify_branch_id" {
  description = "ID of the Amplify branch."
  value       = aws_amplify_branch.aws_amplify_branch[0].id
}

output "amplify_branch_arn" {
  description = "ARN of the Amplify branch."
  value       = aws_amplify_branch.aws_amplify_branch[0].arn
}

output "amplify_branch_custom_domains" {
  description = "Custom domains associated with the Amplify branch."
  value       = aws_amplify_branch.aws_amplify_branch[0].custom_domains
}

output "amplify_branch_source_branch" {
  description = "Source branch if the current branch is a pull request branch."
  value       = aws_amplify_branch.aws_amplify_branch[0].source_branch
}

output "notification_topic_arn" {
  description = "ARN of SNS topic used for Amplify branch build notifications."
  value       = aws_sns_topic.aws_sns_topic[0].arn
  condition   = var.enable_notification
}
