provider "aws" {
  region = "eu-central-1"
  assume_role {
    role_arn = "arn:aws:iam::127352654816:role/FullAccess"
  }
}
