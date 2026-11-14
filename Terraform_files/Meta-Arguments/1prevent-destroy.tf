variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "one" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "test-server"
  }

  lifecycle {
    prevent_destroy = true
  }
}
