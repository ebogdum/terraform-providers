resource "aws_acmpca_certificate_authority" "aws_acmpca_certificate_authority" {
  count = var.create_acmpca_certificate_authority ? 1 : 0

  certificate_authority_configuration {
    key_algorithm     = var.certificate_authority_configuration.key_algorithm
    signing_algorithm = var.certificate_authority_configuration.signing_algorithm

    subject {
      common_name                 = var.certificate_authority_configuration.subject.common_name
      country                     = var.certificate_authority_configuration.subject.country
      distinguished_name_qualifier = var.certificate_authority_configuration.subject.distinguished_name_qualifier
      generation_qualifier        = var.certificate_authority_configuration.subject.generation_qualifier
      given_name                  = var.certificate_authority_configuration.subject.given_name
      initials                    = var.certificate_authority_configuration.subject.initials
      locality                    = var.certificate_authority_configuration.subject.locality
      organization                = var.certificate_authority_configuration.subject.organization
      organizational_unit         = var.certificate_authority_configuration.subject.organizational_unit
      pseudonym                   = var.certificate_authority_configuration.subject.pseudonym
      state                       = var.certificate_authority_configuration.subject.state
      surname                     = var.certificate_authority_configuration.subject.surname
      title                       = var.certificate_authority_configuration.subject.title
    }
  }

  enabled                           = var.enabled
  usage_mode                        = var.usage_mode
  type                              = var.type
  key_storage_security_standard     = var.key_storage_security_standard
  permanent_deletion_time_in_days  = var.permanent_deletion_time_in_days
  tags                              = var.tags

  dynamic "revocation_configuration" {
    for_each = var.revocation_configuration != null ? [var.revocation_configuration] : []
    content {
      dynamic "crl_configuration" {
        for_each = revocation_configuration.value.crl_configuration != null ? [revocation_configuration.value.crl_configuration] : []
        content {
          custom_cname       = crl_configuration.value.custom_cname
          enabled            = crl_configuration.value.enabled
          expiration_in_days = crl_configuration.value.expiration_in_days
          s3_bucket_name     = crl_configuration.value.s3_bucket_name
          s3_object_acl      = crl_configuration.value.s3_object_acl
        }
      }

      dynamic "ocsp_configuration" {
        for_each = revocation_configuration.value.ocsp_configuration != null ? [revocation_configuration.value.ocsp_configuration] : []
        content {
          enabled            = ocsp_configuration.value.enabled
          ocsp_custom_cname = ocsp_configuration.value.ocsp_custom_cname
        }
      }
    }
  }

  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
    ignore_changes        = [tags]
  }
}