provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"
}
