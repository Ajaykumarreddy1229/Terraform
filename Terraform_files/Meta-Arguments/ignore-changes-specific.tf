variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "test-server"
  }

  lifecycle {
    ignore_changes = [
      instance_type,
      tags
    ]
  }
}
