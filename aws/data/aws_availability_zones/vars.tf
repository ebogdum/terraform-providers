variable "all_availability_zones" {
  type    = bool
  default = null
}
variable "exclude_names" {
  type    = set(string)
  default = null
}
variable "exclude_zone_ids" {
  type    = set(string)
  default = null
}
variable "state" {
  type    = string
  default = null
}