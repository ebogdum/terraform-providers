output "id" {
  description = "The unique id of the IAM Server Certificate"
  value       = data.aws_iam_server_certificate.this.id
}

output "arn" {
  description = "The ARN of the IAM Server Certificate"
  value       = data.aws_iam_server_certificate.this.arn
}

output "path" {
  description = "The path of the IAM Server Certificate"
  value       = data.aws_iam_server_certificate.this.path
}

output "expiration_date" {
  description = "The expiration date of the IAM Server Certificate"
  value       = data.aws_iam_server_certificate.this.expiration_date
}

output "upload_date" {
  description = "The date when the server certificate was uploaded"
  value       = data.aws_iam_server_certificate.this.upload_date
}

output "certificate_body" {
  description = "The public key certificate (PEM-encoded)"
  value       = data.aws_iam_server_certificate.this.certificate_body
}

output "certificate_chain" {
  description = "The public key certificate chain (PEM-encoded) if exists, empty otherwise"
  value       = data.aws_iam_server_certificate.this.certificate_chain
}