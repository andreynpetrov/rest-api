locals {
  domain_names = toset(distinct(concat([var.route53_zone_name], var.subject_alternative_names)))
  domain_validation_options = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
}
