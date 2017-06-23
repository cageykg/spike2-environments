terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "kg-terraform-pipeline"
    key    = "TESTC3/vpc/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source     = "../../../modules/vpc"
  vpc_name   = "TESTC3"
  cidr_block = "10.103.0.0/16"
}
