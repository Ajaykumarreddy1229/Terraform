variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  default = ["t3.micro", "t3.small", "t3.medium"]
}

variable "instance_name" {
  default = ["dev-server", "test-server", "prod-server"]
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "myinstance" {
  count         = length(var.instance_type)
  ami           = var.ami_id
  instance_type = var.instance_type[count.index]

  tags = {
    Name = var.instance_name[count.index]
  }
}

output "instance_ids" {
  value = aws_instance.myinstance[*].id
}

output "instance_names" {
  value = aws_instance.myinstance[*].tags.Name
}
