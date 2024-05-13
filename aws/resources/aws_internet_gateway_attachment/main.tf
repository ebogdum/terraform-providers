resource "aws_internet_gateway_attachment" "r_aws_internet_gateway_attachment" {
  internet_gateway_id = var.internet_gateway_id
  vpc_id              = var.vpc_id
}