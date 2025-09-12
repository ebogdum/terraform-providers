output "arn" {
  description = "The Amazon Resource Name (ARN) of the replication set."
  value       = data.aws_ssmincidents_replication_set.this.arn
}

output "created_by" {
  description = "The ARN of the user who created the replication set."
  value       = data.aws_ssmincidents_replication_set.this.created_by
}

output "deletion_protected" {
  description = "If true, the last remaining Region in a replication set can't be deleted."
  value       = data.aws_ssmincidents_replication_set.this.deletion_protected
}

output "last_modified_by" {
  description = "The ARN of the user who last modified the replication set."
  value       = data.aws_ssmincidents_replication_set.this.last_modified_by
}

output "region" {
  description = "(Deprecated) The replication set's Regions. Use regions instead."
  value       = data.aws_ssmincidents_replication_set.this.region
}

output "regions" {
  description = "The replication set's Regions."
  value       = data.aws_ssmincidents_replication_set.this.regions
}

output "status" {
  description = "The overall status of a replication set. Valid Values: ACTIVE | CREATING | UPDATING | DELETING | FAILED"
  value       = data.aws_ssmincidents_replication_set.this.status
}

output "tags" {
  description = "All tags applied to the replication set."
  value       = data.aws_ssmincidents_replication_set.this.tags
}