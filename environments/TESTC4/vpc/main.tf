terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "kg-terraform-pipeline"
    key    = "TESTC4/vpc/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source     = "../../../modules/vpc"
  vpc_name   = "TESTC4"
  cidr_block = "10.104.0.0/16"
}
