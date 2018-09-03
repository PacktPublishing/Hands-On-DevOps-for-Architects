#DevOps for Architects Terraform S3 Provision example

terraform {
  required_version = ">= 0.10.9, < 0.11.9"
}

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  description = "Please enter a globally unique S3 bucket name and I will create it for you."
}


resource "aws_s3_bucket" "s3_bucket_in_terraform" {
  bucket = "${var.bucket_name}"

  versioning {
    enabled = true
  }

}


output "s3_bucket_arn" {
  value = "${aws_s3_bucket.s3_bucket_in_terraform.arn}"
}
