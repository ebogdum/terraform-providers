variable "description" {
  type    = string
  default = null
}
variable "id" {
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
variable "subnet_ids" {
  type = set(string)
}
variable "tags" {
  type    = map(string)
  default = null
}
variable "tags_all" {
  type    = map(string)
  default = null
}
