output "secret_string" {
  description = "The decrypted part of the protected secret information."
  value       = data.aws_secretsmanager_secret_version.this.secret_string
  sensitive   = true
}

output "id" {
  description = "Unique identifier of this version of the secret."
  value       = data.aws_secretsmanager_secret_version.this.id
}

output "version_id" {
  description = "Unique identifier of this version of the secret."
  value       = data.aws_secretsmanager_secret_version.this.version_id
}