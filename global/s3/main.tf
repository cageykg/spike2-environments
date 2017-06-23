provider "aws" {
   region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_pipeline" {
    bucket = "kg-terraform-pipeline"

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
    }
}
