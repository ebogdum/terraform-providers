resource "aws_ebs_default_kms_key" "this" {
  key_arn = var.key_arn
  region  = var.region
}