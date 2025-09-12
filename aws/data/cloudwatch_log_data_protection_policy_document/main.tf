data "aws_cloudwatch_log_data_protection_policy_document" "this" {
  name        = var.name
  description = var.description
  version     = var.policy_version

  dynamic "statement" {
    for_each = var.statement
    content {
      sid              = statement.value.sid
      data_identifiers = statement.value.data_identifiers

      dynamic "operation" {
        for_each = [statement.value.operation]
        content {
          dynamic "audit" {
            for_each = operation.value.audit != null ? [operation.value.audit] : []
            content {
              dynamic "findings_destination" {
                for_each = [audit.value.findings_destination]
                content {
                  dynamic "cloudwatch_logs" {
                    for_each = findings_destination.value.cloudwatch_logs != null ? [findings_destination.value.cloudwatch_logs] : []
                    content {
                      log_group = cloudwatch_logs.value.log_group
                    }
                  }

                  dynamic "firehose" {
                    for_each = findings_destination.value.firehose != null ? [findings_destination.value.firehose] : []
                    content {
                      delivery_stream = firehose.value.delivery_stream
                    }
                  }

                  dynamic "s3" {
                    for_each = findings_destination.value.s3 != null ? [findings_destination.value.s3] : []
                    content {
                      bucket = s3.value.bucket
                    }
                  }
                }
              }
            }
          }

          dynamic "deidentify" {
            for_each = operation.value.deidentify != null ? [operation.value.deidentify] : []
            content {
              dynamic "mask_config" {
                for_each = [deidentify.value.mask_config]
                content {}
              }
            }
          }
        }
      }
    }
  }

  dynamic "configuration" {
    for_each = var.configuration != null ? [var.configuration] : []
    content {
      dynamic "custom_data_identifier" {
        for_each = configuration.value.custom_data_identifier != null ? configuration.value.custom_data_identifier : []
        content {
          name  = custom_data_identifier.value.name
          regex = custom_data_identifier.value.regex
        }
      }
    }
  }
}