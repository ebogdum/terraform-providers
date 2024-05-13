variable "internet_gateway_id" {
  type        = string
  description = "The ID of the Internet Gateway to attach to the VPC"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to attach the Internet Gateway to"
}