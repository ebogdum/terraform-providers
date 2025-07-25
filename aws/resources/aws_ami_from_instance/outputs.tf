output "ami_id" {
  description = "The ID of the newly created Amazon Machine Image (AMI)."
  value       = aws_ami_from_instance.aws_ami_from_instance[0].id
}

output "ami_arn" {
  description = "The Amazon Resource Name (ARN) of the created AMI."
  value       = aws_ami_from_instance.aws_ami_from_instance[0].arn
}