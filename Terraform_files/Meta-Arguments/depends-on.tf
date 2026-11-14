variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Amazon Linux AMI ID for your AWS region"
  type        = string
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myinstance" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "DependsOn-Example"
  }
}

resource "aws_eip" "myinstance_eip" {
  instance   = aws_instance.myinstance.id
  depends_on = [aws_instance.myinstance]
}

output "elastic_ip" {
  value = aws_eip.myinstance_eip.public_ip
}

output "instance_id" {
  value = aws_instance.myinstance.id
}
