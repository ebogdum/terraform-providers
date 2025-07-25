output "amplify_app_id" {
  description = "The ID of the created Amplify App."
  value       = aws_amplify_app.aws_amplify_app[0].id
  condition   = var.create_amplify_webhook
}

output "amplify_branch_name" {
  description = "The name of the Amplify branch associated with the webhook."
  value       = aws_amplify_branch.aws_amplify_branch[0].branch_name
  condition   = var.create_amplify_webhook
}

output "amplify_webhook_arn" {
  description = "The ARN of the created Amplify webhook."
  value       = aws_amplify_webhook.aws_amplify_webhook[0].arn
  condition   = var.create_amplify_webhook
}

output "amplify_webhook_url" {
  description = "The URL endpoint of the created Amplify webhook."
  value       = aws_amplify_webhook.aws_amplify_webhook[0].url
  condition   = var.create_amplify_webhook
}