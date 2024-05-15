variable "description" {
  type    = string
  default = null
}
variable "name" {
  type    = string
  default = null
}
variable "name_prefix" {
  type    = string
  default = null
}
variable "revoke_rules_on_delete" {
  type    = bool
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
variable "vpc_id" {
  type    = string
  default = null
}
