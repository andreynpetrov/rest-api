module "lambda-rest-api" {
  source                  = "github.com/Smartbrood/terraform-aws-lambda.git?ref=main"
  name                    = "rest-api-dev"
  aws_ecr_repository_name = "rest-api"
  image_tag               = "edge"
}
