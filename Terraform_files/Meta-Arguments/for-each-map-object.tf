variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "instances" {
  type = map(object({
    instance_type     = string
    availability_zone = string
  }))

  default = {
    "web-server-1" = {
      instance_type     = "t3.micro"
      availability_zone = "ap-south-1a"
    }

    "web-server-2" = {
      instance_type     = "t3.small"
      availability_zone = "ap-south-1b"
    }

    "app-server-1" = {
      instance_type     = "t3.medium"
      availability_zone = "ap-south-1c"
    }

    "db-server-1" = {
      instance_type     = "m5.large"
      availability_zone = "ap-south-1a"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "servers" {
  for_each = var.instances

  ami               = var.ami_id
  instance_type     = each.value.instance_type
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}

output "instance_ids" {
  value = {
    for k, v in aws_instance.servers : k => v.id
  }
}
