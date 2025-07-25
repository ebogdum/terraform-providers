output "ami_id" {
  description = "The ID of the newly created AMI copy."
  value       = aws_ami_copy.aws_ami_copy[0].id
}

output "ami_arn" {
  description = "The ARN of the newly created AMI copy."
  value       = aws_ami_copy.aws_ami_copy[0].arn
}