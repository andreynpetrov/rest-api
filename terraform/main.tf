resource "aws_lambda_function" "this" {
  function_name                  = "rest-api-dev"
  role                           = data.aws_iam_role.this.arn
  description                    = "For API Gateway"
  memory_size                    = 128
  package_type                   = "Image"
  image_uri                      = "${data.aws_ecr_repository.this.repository_url}:edge"
  publish                        = true
}

resource "aws_lambda_alias" "this" {
  name             = "active"
  description      = "For API Gateway"
  function_name    = aws_lambda_function.this.arn
  function_version = aws_lambda_function.this.version
}