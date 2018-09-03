  #----DevOps for Architects - networking example - main.tf

  variable "vpc_cidr" {
      default = "192.168.0.0/16"
  }

  variable "public_cidrs" {
      default = "192.168.1.0/24"
  }

  variable "ip_allowed_access" {
      default = "0.0.0.0/0"
  }

  data "aws_availability_zones" "available" {}

  resource "aws_vpc" "dfa_vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags {
      Name = "dfa_vpc"
    }
  }

  resource "aws_internet_gateway" "dfa_internet_gateway" {
    vpc_id = "${aws_vpc.dfa_vpc.id}"

    tags {
      Name = "dfa_igw"
    }
  }

  resource "aws_route_table" "dfa_public_rt" {
    vpc_id = "${aws_vpc.dfa_vpc.id}"

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.dfa_internet_gateway.id}"
    }

    tags {
      Name = "dfa_public_route_table"
    }
  }

  resource "aws_default_route_table" "dfa_private_rt" {
    default_route_table_id = "${aws_vpc.dfa_vpc.default_route_table_id}"

    tags {
      Name = "dfa_private_route_table"
    }
  }

  #resource "aws_subnet" "dfa_public_subnet" {

  resource "aws_security_group" "dfa_public_sg" {
    name        = "dfa_public_sg"
    description = "Used for access to the public instances"
    vpc_id      = "${aws_vpc.dfa_vpc.id}"

    #SSH

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["${var.ip_allowed_access}"]
    }

    #HTTP

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["${var.ip_allowed_access}"]
    }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  output "public_sg" {
    value = "${aws_security_group.dfa_public_sg.id}"
  }
