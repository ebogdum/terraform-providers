output "dns_suffix" {
  description = "Base DNS domain name for the current partition (e.g., amazonaws.com in AWS Commercial, amazonaws.com.cn in AWS China)."
  value       = data.aws_partition.this.dns_suffix
}

output "id" {
  description = "Identifier of the current partition (e.g., aws in AWS Commercial, aws-cn in AWS China)."
  value       = data.aws_partition.this.id
}

output "partition" {
  description = "Identifier of the current partition (e.g., aws in AWS Commercial, aws-cn in AWS China)."
  value       = data.aws_partition.this.partition
}

output "reverse_dns_prefix" {
  description = "Prefix of service names (e.g., com.amazonaws in AWS Commercial, cn.com.amazonaws in AWS China)."
  value       = data.aws_partition.this.reverse_dns_prefix
}