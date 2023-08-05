# rest-api
REST API with AWS infra


## Route53 GEO DNS
* For requests from North America: smartbrood.com ALIAS to at CloudFront Distribution (Price class only North America and Europe) with Origins at North America
* For requests from Europe: smartbrood.com ALIAS to at CloudFront Distribution (Price class only North America and Europe) with Origins at Europe


## CloudFront Distribution for North America (us-east-1):
* API Gateway + Lambda + Lambda Authorizer
* ALB + ECS/Fargate service (api-use1-blue)
* S3 bucket for static (static.use1.smartbrood.com)
* S3 bucket for uploads with presigned urls (upload.use1.smartbrood.com)
* DynamoDB


## CloudFront Distribution for Europe (eu-west-1):
* API Gateway + Lambda + Lambda Authorizer
* ALB + ECS/Fargate service (api-euw1-blue)
* S3 bucket for static  (static.euw1.smartbrood.com)
* S3 bucket for uploads with presigned urls (upload.euw1.smartbrood.com)
* DynamoDB


## Terragrunt resources
### Route53
* DNS Records for ACM certificate
* GEO DNS Records for CloudFront Distributions

### ECR
* ECR Repositories for API and Authorizer Lambdas

### CloudFront
* ACM cert for CloudFronts
* CloudFront Distibution

### S3 Buckets
* S3 bucket for static
* S3 bucket for uploads

### DynamoDB
* DynamoDB table

### VPC
* VPC
* Subnets
* Route Tables
* NAT gateways
* Internet Gateways
* VPC Endpoints

### ECS/Fargate
* Fargate Service API

### ALB
* ALB for Fargate Service API