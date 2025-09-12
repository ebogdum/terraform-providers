output "encoding" {
  description = "Specifies the public key encoding format to use in the response."
  value       = data.aws_iam_user_ssh_key.this.encoding
}

output "ssh_public_key_id" {
  description = "Unique identifier for the SSH public key."
  value       = data.aws_iam_user_ssh_key.this.ssh_public_key_id
}

output "username" {
  description = "Name of the IAM user associated with the SSH public key."
  value       = data.aws_iam_user_ssh_key.this.username
}

output "fingerprint" {
  description = "MD5 message digest of the SSH public key."
  value       = data.aws_iam_user_ssh_key.this.fingerprint
}

output "public_key" {
  description = "SSH public key."
  value       = data.aws_iam_user_ssh_key.this.public_key
}

output "status" {
  description = "Status of the SSH public key. Active means that the key can be used for authentication with an CodeCommit repository. Inactive means that the key cannot be used."
  value       = data.aws_iam_user_ssh_key.this.status
}