terraform {
  backend "s3" {
    region = "eu-west-2"
    bucket = "tabi-terraformpipeline"
    key    = "SPIKE1/terraform.tfstate"
    profile = "developmentaws"
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "developmentaws"  
}

module "vpc" {
  source     = "github.com/cageykg/spike1-pipeline//modules/vpc"
  vpc_name   = "TABI-SPIKE1"
  cidr_block = "10.105.0.0/16"
}

module "microservice" {
    source = "github.com/cageykg/spike1-pipeline//modules/microservice"

    service_name = "service-one"
    service_port = 8081
    service_image_id = "ami-4d3a2e29"
    vpc_name = "${module.vpc.aws_vpc.vpc.name}"
    vpc_id = "${module.vpc.aws_vpc.vpc.id}"
    internal_subnet_id = "${module.vpc.aws_subnet.internal_subnet.*.id[0]}"
    external_subnet_id = "${module.vpc.aws_subnet.external_subnet.*.id[0]}"
}
