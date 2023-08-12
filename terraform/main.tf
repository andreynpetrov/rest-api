module "lambda-rest-api" {
  source                  = "git::ssh://git@github.com:Smartbrood/terraform-aws-lambda.git//.?ref=release/v1.0.0"
  name                    = "rest-api-dev"
  aws_ecr_repository_name = "rest-api"
  image_tag               = "edge"
}
