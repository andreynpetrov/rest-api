mock_data "aws_route53_zone" {
  defaults = {
    name = "mydomain.org"
  }
}

mock_resource "aws_acm_certificate" {
  defaults = {
    arn         = "test_arn"
    domain_name = "mydomain.org"
    status      = "OK"
    renewal_summary = [
      {
        renewal_status        = "OK"
        renewal_status_reason = "test_renewal_status_reason"
      },
      {
        renewal_status        = "OK"
        renewal_status_reason = "test_renewal_status_reason"
      },
      {
        renewal_status        = "OK"
        renewal_status_reason = "test_renewal_status_reason"
      }
    ]
    domain_validation_options = [
      {
        domain_name           = "mydomain.org"
        resource_record_name  = "mydomain.org"
        resource_record_value = "test"
        resource_record_type  = "CNAME"
      },
      {
        domain_name           = "www.mydomain.org"
        resource_record_name  = "www.mydomain.org"
        resource_record_value = "test"
        resource_record_type  = "CNAME"
      },
      {
        domain_name           = "api.mydomain.org"
        resource_record_name  = "api.mydomain.org"
        resource_record_value = "test"
        resource_record_type  = "CNAME"
      }
    ]
  }
}
