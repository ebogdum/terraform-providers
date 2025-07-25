output "account_region_opt_status" {
  description = "Map of region names to their opt-in status (opt_status) for each managed AWS account region."
  value = {
    for k, v in aws_account_region.aws_account_region : k => v.opt_status
  }
}