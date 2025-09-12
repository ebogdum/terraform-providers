output "id" {
  description = "ID of the AWS App Runner service HostedZoneId in the selected Region."
  value       = data.aws_apprunner_hosted_zone_id.this.id
}