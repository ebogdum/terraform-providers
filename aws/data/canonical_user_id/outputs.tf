output "id" {
  description = "Canonical user ID associated with the AWS account"
  value       = data.aws_canonical_user_id.this.id
}

output "display_name" {
  description = "Human-friendly name linked to the canonical user ID. The bucket owner's display name. NOTE: This value is only included in the response in the US East (N. Virginia), US West (N. California), US West (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), EU (Ireland), and South America (São Paulo) regions."
  value       = data.aws_canonical_user_id.this.display_name
}