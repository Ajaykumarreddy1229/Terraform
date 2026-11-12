provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0492447090ced6eb5"
  instance_type = "t2.micro"

  tags = {
    Name = "taint-server-example"
  }
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "test-bkt-dkkfg-reya"
}
