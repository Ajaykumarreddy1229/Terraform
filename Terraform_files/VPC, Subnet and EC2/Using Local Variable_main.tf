#Using Local Variable
provider "aws" {
  region = "ap-south-1"
}

locals {
  env = "Prod"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "${local.env}-VPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${local.env}-Subnet"
  }
}

resource "aws_instance" "myinstance" {
  subnet_id     = aws_subnet.subnet1.id
  ami           = "ami-0492447090ced6eb5"
  instance_type = "t2.micro"

  tags = {
    Name = "${local.env}-Server"
  }
}
