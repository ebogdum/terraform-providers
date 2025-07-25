resource "aws_ami_copy" "aws_ami_copy" {
  count                    = var.create_ami_copy ? 1 : 0
  name                     = var.ami_name
  source_ami_id            = var.source_ami_id
  source_ami_region        = var.source_ami_region
  destination_outpost_arn  = var.destination_outpost_arn
  encrypted                = var.encrypted
  kms_key_id               = var.kms_key_id
  tags                     = var.tags

  lifecycle {
    prevent_destroy         = true
    create_before_destroy   = true
    ignore_changes          = [tags]
  }
}