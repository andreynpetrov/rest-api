data "aws_region" "this" {}

data "aws_partition" "this" {}

data "aws_caller_identity" "this" {}

data "aws_s3_bucket" "mytest" {
  count  = var.enabled_s3_data == true ? 1 : 0
  bucket = "mytest"
}
