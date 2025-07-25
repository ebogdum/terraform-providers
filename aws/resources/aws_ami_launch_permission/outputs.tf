output "ami_launch_permission_ids" {
  description = "Map of AMI launch permission resource IDs keyed by their permission name."
  value       = { for k, p in aws_ami_launch_permission.aws_ami_launch_permission : k => p.id }
}