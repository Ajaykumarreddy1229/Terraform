variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myinstance" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "test-server"
  }

  lifecycle {
    ignore_changes = all
  }
}

output "instance_id" {
  value = aws_instance.myinstance.id
}

output "instance_name" {
  value = aws_instance.myinstance.tags.Name
}
