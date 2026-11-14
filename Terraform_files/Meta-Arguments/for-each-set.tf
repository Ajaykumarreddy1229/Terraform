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
  for_each = toset([
    "dev-server",
    "test-server",
    "prod-server"
  ])

  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }
}

output "instance_ids" {
  value = {
    for k, v in aws_instance.myinstance : k => v.id
  }
}

output "instance_names" {
  value = {
    for k, v in aws_instance.myinstance : k => v.tags.Name
  }
}
