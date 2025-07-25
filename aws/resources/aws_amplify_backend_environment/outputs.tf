output "amplify_backend_environment_id" {
  description = "The unique ID of the created Amplify backend environment."
  value       = aws_amplify_backend_environment.aws_amplify_backend_environment[0].id
  condition   = var.create_amplify_backend_environment
}

output "amplify_backend_environment_arn" {
  description = "The ARN of the Amplify backend environment."
  value       = aws_amplify_backend_environment.aws_amplify_backend_environment[0].arn
  condition   = var.create_amplify_backend_environment
}

output "amplify_app_id" {
  description = "The unique ID of the Amplify app."
  value       = var.create_amplify_app ? aws_amplify_app.aws_amplify_app[0].id : var.amplify_app_id
}