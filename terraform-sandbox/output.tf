output "region" {
  value = data.aws_region.this.name
}

output "account_id" {
  value = data.aws_caller_identity.this.account_id
}

output "aws_partition" {
  value = data.aws_partition.this.partition
}

output "s3_bucket" {
  value = data.aws_s3_bucket.mytest[*].id
}