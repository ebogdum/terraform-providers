variable "cidr_ipv4" {
  type    = string
  default = null
}
variable "cidr_ipv6" {
  type    = string
  default = null
}
variable "description" {
  type    = string
  default = null
}
variable "from_port" {
  type    = number
  default = null
}
variable "ip_protocol" {
  type = string
}
variable "prefix_list_id" {
  type    = string
  default = null
}
variable "referenced_security_group_id" {
  type    = string
  default = null
}
variable "security_group_id" {
  type = string
}
variable "tags" {
  type    = map(string)
  default = null
}
variable "to_port" {
  type    = number
  default = null
}
