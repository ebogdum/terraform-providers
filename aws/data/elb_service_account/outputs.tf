output "id" {
  description = "ID of the AWS ELB service account in the selected Region."
  value       = data.aws_elb_service_account.this.id
}

output "arn" {
  description = "ARN of the AWS ELB service account in the selected Region."
  value       = data.aws_elb_service_account.this.arn
}