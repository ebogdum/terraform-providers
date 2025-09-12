output "id" {
  description = "The group's name"
  value       = aws_iam_group.this.id
}

output "arn" {
  description = "The ARN assigned by AWS for this group"
  value       = aws_iam_group.this.arn
}

output "name" {
  description = "The group's name"
  value       = aws_iam_group.this.name
}

output "path" {
  description = "The path of the group in IAM"
  value       = aws_iam_group.this.path
}

output "unique_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_group.this.unique_id
}