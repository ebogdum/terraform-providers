resource "aws_lightsail_key_pair" "this" {
  name        = var.name
  name_prefix = var.name_prefix
  pgp_key     = var.pgp_key
  public_key  = var.public_key
  region      = var.region
  tags        = var.tags
}