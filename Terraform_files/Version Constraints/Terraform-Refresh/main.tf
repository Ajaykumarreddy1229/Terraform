
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

resource "aws_instance" "one" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "reyaz-server"
  }
}

output "instance_id" {
  value = aws_instance.one.id
}
