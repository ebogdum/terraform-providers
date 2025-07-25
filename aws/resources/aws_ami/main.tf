resource "aws_ami" "aws_ami" {
  count               = var.create_aws_ami ? 1 : 0
  name                = var.ami_name
  virtualization_type = var.virtualization_type
  root_device_name    = var.root_device_name
  architecture        = var.architecture
  boot_mode           = var.boot_mode
  deprecation_time    = var.deprecation_time
  description         = var.description
  ena_support         = var.ena_support
  imds_support        = var.imds_support
  sriov_net_support   = var.sriov_net_support
  tpm_support         = var.tpm_support
  uefi_data           = var.uefi_data
  tags                = var.tags

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices
    content {
      device_name           = ebs_block_device.value.device_name
      snapshot_id           = ebs_block_device.value.snapshot_id
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted             = ebs_block_device.value.encrypted
      iops                  = ebs_block_device.value.iops
      throughput            = ebs_block_device.value.throughput
      outpost_arn           = ebs_block_device.value.outpost_arn
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_devices
    content {
      device_name  = ephemeral_block_device.value.device_name
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  lifecycle {
    prevent_destroy      = true
    ignore_changes       = [tags]
    create_before_destroy = true
  }
}