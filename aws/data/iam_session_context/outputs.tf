output "arn" {
  description = "ARN for an assumed role"
  value       = data.aws_iam_session_context.this.arn
}

output "issuer_arn" {
  description = "IAM source role ARN if arn corresponds to an STS assumed role. Otherwise, issuer_arn is equal to arn"
  value       = data.aws_iam_session_context.this.issuer_arn
}

output "issuer_id" {
  description = "Unique identifier of the IAM role that issues the STS assumed role"
  value       = data.aws_iam_session_context.this.issuer_id
}

output "issuer_name" {
  description = "Name of the source role. Only available if arn corresponds to an STS assumed role"
  value       = data.aws_iam_session_context.this.issuer_name
}

output "session_name" {
  description = "Name of the STS session. Only available if arn corresponds to an STS assumed role"
  value       = data.aws_iam_session_context.this.session_name
}