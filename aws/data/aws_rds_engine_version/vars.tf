variable "default_only" {
  type    = bool
  default = null
}
variable "engine" {
  type = string
}
variable "has_major_target" {
  type    = bool
  default = null
}
variable "has_minor_target" {
  type    = bool
  default = null
}
variable "include_all" {
  type    = bool
  default = null
}
variable "latest" {
  type    = bool
  default = null
}
variable "parameter_group_family" {
  type    = string
  default = null
}
variable "preferred_major_targets" {
  type    = list(string)
  default = null
}
variable "preferred_upgrade_targets" {
  type    = list(string)
  default = null
}
variable "preferred_versions" {
  type    = list(string)
  default = null
}
variable "engine_version" {
  type    = string
  default = null
}
