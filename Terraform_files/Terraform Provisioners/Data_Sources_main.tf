terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_s3_bucket" "existing" {
  bucket = var.existing_bucket_name
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}

output "latest_ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "existing_bucket_arn" {
  value = data.aws_s3_bucket.existing.arn
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
