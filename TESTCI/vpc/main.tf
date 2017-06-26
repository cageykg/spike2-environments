terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE2/TESTCI/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"
}

module "vpc" {
  source     = "../../../networking-modules/vpc"
  vpc_name   = "TESTCI"
  cidr_block = "10.5.0.0/16"
}
