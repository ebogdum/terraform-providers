output "cidr_blocks" {
  description = "Lexically ordered list of CIDR blocks"
  value       = data.aws_ip_ranges.this.cidr_blocks
}

output "ipv6_cidr_blocks" {
  description = "Lexically ordered list of IPv6 CIDR blocks"
  value       = data.aws_ip_ranges.this.ipv6_cidr_blocks
}

output "create_date" {
  description = "Publication time of the IP ranges (e.g., '2016-08-03-23-46-05')"
  value       = data.aws_ip_ranges.this.create_date
}

output "sync_token" {
  description = "Publication time of the IP ranges, in Unix epoch time format (e.g., '1470267965')"
  value       = data.aws_ip_ranges.this.sync_token
}