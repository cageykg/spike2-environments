provider "aws" {
   region = "eu-west-2"
}

resource "aws_s3_bucket" "terraform_pipeline" {
    bucket = "tabi-terraformpipeline"

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = true
    }
}
