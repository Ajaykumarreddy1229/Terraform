
provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = "t2.micro"
}
