data "aws_ecr_repository" "this" {
  name = "rest-api"
}

data "aws_iam_role" "this" {
  name = "Pets-role-4xifmbgr"
}


