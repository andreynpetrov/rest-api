mock_provider "aws" {
  alias  = "fake"
  source = "./testing/aws"
}

run "acm" {

  command = apply

  providers = {
    aws = aws.fake
  }

  assert {
    condition     = output.arn == "test_arn"
    error_message = "Wrong arn in output"
  }

  assert {
    condition     = output.domain_name == "mydomain.org"
    error_message = "Wrong domain_name in output"
  }

  assert {
    condition     = output.status == "OK"
    error_message = "Wrong status in output"
  }

  assert {
    condition     = output.renewal_summary[0].renewal_status == "OK"
    error_message = "Wrong renewal_summary in output"
  }
}
