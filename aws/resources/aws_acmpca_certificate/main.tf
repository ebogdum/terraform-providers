resource "aws_acmpca_certificate" "aws_acmpca_certificate" {
  count                         = var.create_acmpca_certificate ? 1 : 0
  certificate_authority_arn    = var.certificate_authority_arn
  certificate_signing_request  = var.certificate_signing_request
  signing_algorithm             = var.signing_algorithm
  template_arn                  = var.template_arn

  dynamic "validity" {
    for_each = [var.validity]
    content {
      type  = validity.value["type"]
      value = validity.value["value"]
    }
  }

  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
  }
}

resource "tls_private_key" "tls_private_key" {
  count    = var.create_tls_resources ? 1 : 0
  algorithm = var.private_key_algorithm
}

resource "tls_cert_request" "tls_cert_request" {
  count            = var.create_tls_resources ? 1 : 0
  private_key_pem  = tls_private_key.tls_private_key[0].private_key_pem
  subject = {
    common_name = var.csr_common_name
  }
}