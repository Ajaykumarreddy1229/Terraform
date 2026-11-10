provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myinstance" {
  count         = 3
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "Server-${count.index + 1}"
  }
}
