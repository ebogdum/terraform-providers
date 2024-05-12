variable "assign_generated_ipv6_cidr_block" {
  type    = bool
  default = null
}
variable "cidr_block" {
  type    = string
  default = null
}
variable "enable_dns_hostnames" {
  type    = bool
  default = null
}
variable "enable_dns_support" {
  type    = bool
  default = null
}
variable "enable_network_address_usage_metrics" {
  type    = bool
  default = null
}
variable "id" {
  type    = string
  default = null
}
variable "instance_tenancy" {
  type    = string
  default = null
}
variable "ipv4_ipam_pool_id" {
  type    = string
  default = null
}
variable "ipv4_netmask_length" {
  type    = number
  default = null
}
variable "ipv6_cidr_block" {
  type    = string
  default = null
}
variable "ipv6_cidr_block_network_border_group" {
  type    = string
  default = null
}
variable "ipv6_ipam_pool_id" {
  type    = string
  default = null
}
variable "ipv6_netmask_length" {
  type    = number
  default = null
}
variable "tags" {
  type    = map(string)
  default = null
}
variable "tags_all" {
  type    = map(string)
  default = null
}
