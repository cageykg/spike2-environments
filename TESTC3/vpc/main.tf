terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE2/TESTC3/vpc/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"
}

module "vpc" {
  source     = "github.com/cageykg/spike2-networking-modules//vpc?ref=v1.0.0"
  vpc_name   = "TESTC3"
  cidr_block = "10.6.0.0/16"
}
