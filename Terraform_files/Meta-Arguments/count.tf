variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "instance_count" {
  default = 2
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myinstance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "WebServer-${count.index}"
  }
}

output "instance_ids" {
  value = aws_instance.myinstance[*].id
}

output "instance_names" {
  value = aws_instance.myinstance[*].tags.Name
}
