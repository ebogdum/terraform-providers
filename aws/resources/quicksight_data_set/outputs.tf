output "arn" {
  description = "Amazon Resource Name (ARN) of the data set"
  value       = aws_quicksight_data_set.this.arn
}

output "id" {
  description = "A comma-delimited string joining AWS account ID and data set ID"
  value       = aws_quicksight_data_set.this.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = aws_quicksight_data_set.this.tags_all
}