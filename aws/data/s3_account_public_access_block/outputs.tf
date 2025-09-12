output "id" {
  description = "AWS account ID"
  value       = data.aws_s3_account_public_access_block.this.id
}

output "block_public_acls" {
  description = "Whether or not Amazon S3 should block public ACLs for buckets in this account is enabled"
  value       = data.aws_s3_account_public_access_block.this.block_public_acls
}

output "block_public_policy" {
  description = "Whether or not Amazon S3 should block public bucket policies for buckets in this account is enabled"
  value       = data.aws_s3_account_public_access_block.this.block_public_policy
}

output "ignore_public_acls" {
  description = "Whether or not Amazon S3 should ignore public ACLs for buckets in this account is enabled"
  value       = data.aws_s3_account_public_access_block.this.ignore_public_acls
}

output "restrict_public_buckets" {
  description = "Whether or not Amazon S3 should restrict public bucket policies for buckets in this account is enabled"
  value       = data.aws_s3_account_public_access_block.this.restrict_public_buckets
}