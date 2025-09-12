resource "aws_fsx_ontap_volume" "this" {
  name                                 = var.name
  storage_virtual_machine_id           = var.storage_virtual_machine_id
  region                               = var.region
  bypass_snaplock_enterprise_retention = var.bypass_snaplock_enterprise_retention
  copy_tags_to_backups                 = var.copy_tags_to_backups
  final_backup_tags                    = var.final_backup_tags
  junction_path                        = var.junction_path
  ontap_volume_type                    = var.ontap_volume_type
  security_style                       = var.security_style
  size_in_bytes                        = var.size_in_bytes
  size_in_megabytes                    = var.size_in_megabytes
  skip_final_backup                    = var.skip_final_backup
  snapshot_policy                      = var.snapshot_policy
  storage_efficiency_enabled           = var.storage_efficiency_enabled
  tags                                 = var.tags
  volume_style                         = var.volume_style

  dynamic "aggregate_configuration" {
    for_each = var.aggregate_configuration != null ? [var.aggregate_configuration] : []
    content {
      aggregates                 = aggregate_configuration.value.aggregates
      constituents_per_aggregate = aggregate_configuration.value.constituents_per_aggregate
    }
  }

  dynamic "snaplock_configuration" {
    for_each = var.snaplock_configuration != null ? [var.snaplock_configuration] : []
    content {
      snaplock_type              = snaplock_configuration.value.snaplock_type
      audit_log_volume           = snaplock_configuration.value.audit_log_volume
      privileged_delete          = snaplock_configuration.value.privileged_delete
      volume_append_mode_enabled = snaplock_configuration.value.volume_append_mode_enabled

      dynamic "autocommit_period" {
        for_each = snaplock_configuration.value.autocommit_period != null ? [snaplock_configuration.value.autocommit_period] : []
        content {
          type  = autocommit_period.value.type
          value = autocommit_period.value.value
        }
      }

      dynamic "retention_period" {
        for_each = snaplock_configuration.value.retention_period != null ? [snaplock_configuration.value.retention_period] : []
        content {
          dynamic "default_retention" {
            for_each = retention_period.value.default_retention != null ? [retention_period.value.default_retention] : []
            content {
              type  = default_retention.value.type
              value = default_retention.value.value
            }
          }

          dynamic "maximum_retention" {
            for_each = retention_period.value.maximum_retention != null ? [retention_period.value.maximum_retention] : []
            content {
              type  = maximum_retention.value.type
              value = maximum_retention.value.value
            }
          }

          dynamic "minimum_retention" {
            for_each = retention_period.value.minimum_retention != null ? [retention_period.value.minimum_retention] : []
            content {
              type  = minimum_retention.value.type
              value = minimum_retention.value.value
            }
          }
        }
      }
    }
  }

  dynamic "tiering_policy" {
    for_each = var.tiering_policy != null ? [var.tiering_policy] : []
    content {
      name           = tiering_policy.value.name
      cooling_period = tiering_policy.value.cooling_period
    }
  }

  timeouts {
    create = "30m"
    delete = "30m"
    update = "30m"
  }
}