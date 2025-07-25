resource "aws_acm_certificate" "aws_acm_certificate" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}

data "aws_route53_zone" "aws_route53_zone" {
  for_each      = var.route53_zones
  name          = each.key
  private_zone  = each.value.private_zone
}

resource "aws_route53_record" "aws_route53_record" {
  for_each = { for dvo in aws_acm_certificate.aws_acm_certificate.domain_validation_options : dvo.domain_name => {
    name    = dvo.resource_record_name
    record  = dvo.resource_record_value
    type    = dvo.resource_record_type
    zone_id = lookup(var.domain_zone_map, dvo.domain_name, null)
  } }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = each.value.zone_id
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}

resource "aws_acm_certificate_validation" "aws_acm_certificate_validation" {
  count                     = var.create_certificate_validation ? 1 : 0
  certificate_arn          = aws_acm_certificate.aws_acm_certificate.arn
  validation_record_fqdns  = [for record in aws_route53_record.aws_route53_record : record.fqdn]
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}