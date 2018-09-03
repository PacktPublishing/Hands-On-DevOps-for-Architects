terraform {
  required_version = ">= 0.11.6, < 0.11.9"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dfa_server1" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"

  tags {
    Name = "dfa_server1"
  }
}
