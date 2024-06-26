variable "description" {
  type    = string
  default = null
}
variable "family" {
  type = string
}
variable "name" {
  type    = string
  default = null
}
variable "name_prefix" {
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
variable "parameters" {
  type = list(object({
    name         = string
    value        = string
    apply_method = string
  }))
  default = [
    {
      name         = null
      value        = null
      apply_method = "immediate"
    }
  ]
}