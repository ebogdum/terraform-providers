output "id" {
  description = "ID of the hosted zone."
  value       = data.aws_elastic_beanstalk_hosted_zone.this.id
}

output "region" {
  description = "Name of the Region whose hosted zone is desired."
  value       = data.aws_elastic_beanstalk_hosted_zone.this.region
}