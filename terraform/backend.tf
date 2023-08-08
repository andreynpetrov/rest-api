terraform {
  backend "s3" {
    bucket = "tfstates.smartbrood.com"
    key    = "rest-api-dev.tfstate"
    region = "eu-west-1"
    dynamodb_table = "tf-state-locks"
  }
}