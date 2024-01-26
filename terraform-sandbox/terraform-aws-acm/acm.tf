resource "aws_acm_certificate" "this" {
  domain_name               = var.route53_zone_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true

    precondition {
      condition     = length(local.domain_names) == length(var.subject_alternative_names) + 1
      error_message = "Dublicated domain names"
    }
  }

  tags = var.tags
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}

resource "aws_route53_record" "acm_validation" {
  for_each        = local.domain_names
  allow_overwrite = true
  name            = local.domain_validation_options[each.key].name
  records         = [local.domain_validation_options[each.key].record]
  ttl             = var.ttl
  type            = local.domain_validation_options[each.key].type
  zone_id         = data.aws_route53_zone.this.id
}
