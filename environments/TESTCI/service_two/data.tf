data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    region = "eu-west-1"
    bucket = "kg-terraform-pipeline"  
    key = "TESTCI/vpc/terraform.tfstate"
  }
}