output "plaintext" {
  description = "Map containing each secret name as the key with its decrypted plaintext value"
  value       = data.aws_kms_secrets.this.plaintext
  sensitive   = true
}