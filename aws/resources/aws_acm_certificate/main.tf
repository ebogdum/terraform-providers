resource "aws_acm_certificate" "aws_acm_certificate" {
  count = var.create_acm_certificate ? 1 : 0

  domain_name               = var.acm_domain_name
  validation_method        = var.acm_validation_method
  subject_alternative_names = var.acm_subject_alternative_names
  key_algorithm            = var.acm_key_algorithm
  certificate_authority_arn = var.acm_certificate_authority_arn
  private_key              = var.acm_private_key
  certificate_body         = var.acm_certificate_body
  certificate_chain        = var.acm_certificate_chain
  early_renewal_duration   = var.acm_early_renewal_duration
  tags                     = var.acm_tags

  dynamic "validation_option" {
    for_each = var.acm_validation_options
    content {
      domain_name       = validation_option.value.domain_name
      validation_domain = validation_option.value.validation_domain
    }
  }

  dynamic "options" {
    for_each = var.acm_options
    content {
      certificate_transparency_logging_preference = options.value.certificate_transparency_logging_preference
      export                                      = options.value.export
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}