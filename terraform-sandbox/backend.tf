terraform {
  backend "s3" {
    bucket = "tfstates.smartbrood.com"
    key    = "sandbox.tfstate"
    region = "eu-west-1"
    dynamodb_table = "tf-state-locks"
  }
}