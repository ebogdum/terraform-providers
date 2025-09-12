data "aws_kms_secrets" "this" {
  dynamic "secret" {
    for_each = var.secrets
    content {
      name                 = secret.value.name
      payload              = secret.value.payload
      context              = secret.value.context
      grant_tokens         = secret.value.grant_tokens
      encryption_algorithm = secret.value.encryption_algorithm
      key_id               = secret.value.key_id
    }
  }
}