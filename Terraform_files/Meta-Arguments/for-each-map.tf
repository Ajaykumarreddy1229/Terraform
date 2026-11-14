variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "instances" {
  type = map(string)

  default = {
    "web-server-1" = "t3.micro"
    "web-server-2" = "t3.small"
    "app-server-1" = "t3.medium"
    "db-server-1"  = "m5.large"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myinstance" {
  for_each = var.instances

  ami           = var.ami_id
  instance_type = each.value

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
