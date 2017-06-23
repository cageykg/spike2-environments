terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "kg-terraform-pipeline"
    key    = "TESTCI/vpc/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source     = "../../../modules/vpc"
  vpc_name   = "TESTCI"
  cidr_block = "10.100.0.0/16"
}
