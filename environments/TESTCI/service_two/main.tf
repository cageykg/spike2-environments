terraform {
  backend "s3" {
      region = "eu-west-1"
      bucket = "kg-terraform-pipeline"
      key = "TESTCI/service_two/terraform.tfstate"
  }
}
 
provider "aws" {
   region = "eu-west-1"
}

module "microservice" {
    source = "../../../modules/microservice"

    service_name = "service-two"
    service_port = 8081
    vpc_name = "${data.terraform_remote_state.vpc.aws_vpc.vpc.name}"
    vpc_id = "${data.terraform_remote_state.vpc.aws_vpc.vpc.id}"
    internal_subnet_id = "${data.terraform_remote_state.vpc.aws_subnet.internal_subnet.*.id[0]}"
    external_subnet_id = "${data.terraform_remote_state.vpc.aws_subnet.external_subnet.*.id[0]}"
}