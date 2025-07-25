data "aws_partition" "aws_partition" {}

resource "aws_acmpca_certificate_authority" "aws_acmpca_certificate_authority" {
  count = var.create_certificate_authorities ? length(var.certificate_authorities) : 0

  type = var.certificate_authorities[count.index].type

  certificate_authority_configuration {
    key_algorithm     = var.certificate_authorities[count.index].configuration.key_algorithm
    signing_algorithm = var.certificate_authorities[count.index].configuration.signing_algorithm

    subject {
      common_name = var.certificate_authorities[count.index].configuration.subject.common_name
    }
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }
}

resource "aws_acmpca_certificate" "aws_acmpca_certificate" {
  for_each = var.create_certificates ? { for cert in var.certificates : cert.name => cert } : {}

  certificate_authority_arn   = each.value.certificate_authority_arn
  certificate_signing_request = each.value.certificate_signing_request
  signing_algorithm           = each.value.signing_algorithm
  template_arn                = "arn:${data.aws_partition.aws_partition.partition}:acm-pca:::template/${each.value.template_name}/${each.value.template_version}"

  validity {
    type  = each.value.validity.type
    value = each.value.validity.value
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }
}

resource "aws_acmpca_certificate_authority_certificate" "aws_acmpca_certificate_authority_certificate" {
  for_each = var.create_certificate_auth_certificates ? { for cert in var.cert_authority_certificates : cert.name => cert } : {}

  certificate_authority_arn = each.value.certificate_authority_arn
  certificate               = each.value.certificate

  dynamic "certificate_chain" {
    for_each = each.value.certificate_chain != null ? [each.value.certificate_chain] : []
    content {
      certificate_chain = certificate_chain.value
    }
  }

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }
}