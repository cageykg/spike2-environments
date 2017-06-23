terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "kg-terraform-pipeline"
    key    = "SPIKE1/terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source     = "../../modules/vpc"
  vpc_name   = "SPIKE1"
  cidr_block = "10.105.0.0/16"
}

module "microservice" {
    source = "../../modules/microservice"

    service_name = "service-one"
    service_port = 8081
    vpc_name = "${module.vpc.aws_vpc.vpc.name}"
    vpc_id = "${module.vpc.aws_vpc.vpc.id}"
    internal_subnet_id = "${module.vpc.aws_subnet.internal_subnet.*.id[0]}"
    external_subnet_id = "${module.vpc.aws_subnet.external_subnet.*.id[0]}"
}
