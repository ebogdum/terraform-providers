output "access_keys" {
  description = "List of the IAM access keys associated with the specified user"
  value       = data.aws_iam_access_keys.this.access_keys
}

output "access_key_id" {
  description = "Access key ID"
  value       = data.aws_iam_access_keys.this.access_keys[*].access_key_id
}

output "create_date" {
  description = "Date and time in RFC3339 format that the access key was created"
  value       = data.aws_iam_access_keys.this.access_keys[*].create_date
}

output "status" {
  description = "Access key status. Possible values are Active and Inactive"
  value       = data.aws_iam_access_keys.this.access_keys[*].status
}