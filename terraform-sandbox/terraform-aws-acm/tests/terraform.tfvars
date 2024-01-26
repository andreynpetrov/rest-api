route53_zone_name         = "mydomain.org"
subject_alternative_names = ["www.mydomain.org", "api.mydomain.org"]
ttl                       = 60
tags = {
  Terraform   = true
  Environment = "dev"
}
