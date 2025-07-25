output "ami_id" {
  description = "The ID of the created Amazon Machine Image."
  value       = try(aws_ami.aws_ami[0].id, null)
}

output "ami_arn" {
  description = "The ARN of the created AMI."
  value       = try(aws_ami.aws_ami[0].arn, null)
}

output "ami_owner_id" {
  description = "The AWS account ID of the AMI owner."
  value       = try(aws_ami.aws_ami[0].owner_id, null)
}

output "ami_root_snapshot_id" {
  description = "The snapshot ID for the root volume, if applicable."
  value       = try(aws_ami.aws_ami[0].root_snapshot_id, null)
}

output "ami_platform_details" {
  description = "Platform details associated with the AMI."
  value       = try(aws_ami.aws_ami[0].platform_details, null)
}

output "ami_usage_operation" {
  description = "Usage operation and billing code associated with the AMI."
  value       = try(aws_ami.aws_ami[0].usage_operation, null)
}