variable "bypass_policy_lockout_safety_check" {
  type    = bool
  default = null
}
variable "custom_key_store_id" {
  type    = string
  default = null
}
variable "customer_master_key_spec" {
  type    = string
  default = null
}
variable "deletion_window_in_days" {
  type    = number
  default = null
}
variable "description" {
  type    = string
  default = null
}
variable "enable_key_rotation" {
  type    = bool
  default = null
}
variable "id" {
  type    = string
  default = null
}
variable "is_enabled" {
  type    = bool
  default = null
}
variable "key_usage" {
  type    = string
  default = null
}
variable "multi_region" {
  type    = bool
  default = null
}
variable "policy" {
  type    = string
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
variable "xks_key_id" {
  type    = string
  default = null
}
