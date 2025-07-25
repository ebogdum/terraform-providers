resource "aws_ami_from_instance" "aws_ami_from_instance" {
  count                 = var.create_ami_from_instance ? 1 : 0
  name                  = var.ami_name
  source_instance_id    = var.source_instance_id
  snapshot_without_reboot = var.snapshot_without_reboot
  tags                  = var.ami_tags

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }

  timeouts {
    create = "40m"
    update = "40m"
    delete = "90m"
  }
}