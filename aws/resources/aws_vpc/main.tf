resource "aws_vpc" "r_aws_vpc" {
  assign_generated_ipv6_cidr_block     = var.assign_generated_ipv6_cidr_block
  cidr_block                           = var.cidr_block
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_dns_support                   = var.enable_dns_support
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  instance_tenancy                     = var.instance_tenancy
  ipv4_ipam_pool_id                    = var.ipv4_ipam_pool_id
  ipv4_netmask_length                  = var.ipv4_netmask_length
  ipv6_cidr_block                      = var.ipv6_cidr_block
  ipv6_cidr_block_network_border_group = var.ipv6_cidr_block_network_border_group
  ipv6_ipam_pool_id                    = var.ipv6_ipam_pool_id
  ipv6_netmask_length                  = var.ipv6_netmask_length
  tags                                 = var.tags
  tags_all                             = var.tags_all
}
