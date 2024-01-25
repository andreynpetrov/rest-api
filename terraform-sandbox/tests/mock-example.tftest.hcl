provider "aws" {
  region = "eu-west-1"
}

mock_provider "aws" {
  alias  = "fake"
  source = "./testing/aws"
}

run "s3_bucket" {

  command = apply

  providers = {
    aws = aws.fake
  }

  variables {
    enabled         = true
    enabled_s3_data = true
    separator       = "/"
    environment     = "stg"
    cluster         = "green"
  }

  assert {
    condition     = data.aws_s3_bucket.mytest[0].id == "mytest"
    error_message = "s3 bucket error"
  }

}
