output "amplify_app_id" {
  description = "Unique ID of the Amplify App."
  value       = aws_amplify_app.aws_amplify_app[0].id
}

output "amplify_app_arn" {
  description = "ARN of the Amplify App."
  value       = aws_amplify_app.aws_amplify_app[0].arn
}

output "amplify_app_default_domain" {
  description = "Default domain of the Amplify App."
  value       = aws_amplify_app.aws_amplify_app[0].default_domain
}

output "amplify_app_production_branch" {
  description = "Details of the Amplify App production branch."
  value       = aws_amplify_app.aws_amplify_app[0].production_branch
}
