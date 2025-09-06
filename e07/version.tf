terraform {
  required_version = ">= 1.13"

  backend "s3" {
    bucket       = "innedimx-terraform-states"
    key          = "states/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.12"
    }
  }
}
