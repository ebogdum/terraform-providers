data "aws_caller_identity" "aws_caller_identity" {}

data "aws_iam_policy_document" "aws_iam_policy_document" {
  statement {
    sid    = "1"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.aws_caller_identity.account_id]
    }

    actions = [
      "acm-pca:DescribeCertificateAuthority",
      "acm-pca:GetCertificate",
      "acm-pca:GetCertificateAuthorityCertificate",
      "acm-pca:ListPermissions",
      "acm-pca:ListTags"
    ]

    resources = [var.certificate_authority_arn]
  }

  statement {
    sid    = "2"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.aws_caller_identity.account_id]
    }

    actions   = ["acm-pca:IssueCertificate"]
    resources = [var.certificate_authority_arn]

    condition {
      test     = "StringEquals"
      variable = "acm-pca:TemplateArn"
      values   = [var.certificate_template_arn]
    }
  }
}

resource "aws_acmpca_policy" "aws_acmpca_policy" {
  count        = var.create_acmpca_policy ? 1 : 0
  resource_arn = var.certificate_authority_arn
  policy       = data.aws_iam_policy_document.aws_iam_policy_document.json

  lifecycle {
    prevent_destroy = true
  }
}