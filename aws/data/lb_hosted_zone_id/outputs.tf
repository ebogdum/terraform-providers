output "id" {
  description = "ID of the AWS ELB HostedZoneId in the selected Region."
  value       = data.aws_lb_hosted_zone_id.this.id
}