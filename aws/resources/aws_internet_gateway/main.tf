resource "aws_internet_gateway" "r_aws_internet_gateway" {
  tags     = var.tags
  tags_all = var.tags_all
  vpc_id   = var.vpc_id
}
