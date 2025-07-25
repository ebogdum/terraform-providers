resource "aws_acmpca_certificate_authority" "aws_acmpca_certificate_authority" {
  count = var.create_certificate_authority ? 1 : 0

  certificate_authority_configuration {
    key_algorithm     = var.certificate_authority_configuration.key_algorithm
    signing_algorithm = var.certificate_authority_configuration.signing_algorithm

    subject {
      common_name = var.certificate_authority_configuration.subject.common_name
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_acmpca_permission" "aws_acmpca_permission" {
  count                         = var.create_acmpca_permission ? 1 : 0
  certificate_authority_arn    = var.create_certificate_authority ? aws_acmpca_certificate_authority.aws_acmpca_certificate_authority[0].arn : var.external_certificate_authority_arn
  actions                      = var.actions
  principal                    = var.principal
  source_account               = var.source_account

  lifecycle {
    prevent_destroy = true
  }
}