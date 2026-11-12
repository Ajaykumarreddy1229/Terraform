provider "aws" {
  region = "ap-south-1"
}

locals {
  instance_types = {
    dev   = "t2.micro"
    test  = "t2.small"
    prod  = "t2.medium"
  }
}

resource "aws_instance" "workspace-example" {
  ami           = "ami-08ee1453725d19cdb"
  instance_type = local.instance_types[terraform.workspace]

  tags = {
    Name = "${terraform.workspace}-server"
  }
}

output "active_workspace" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}

output "selected_instance_type" {
  description = "Instance type selected for the current workspace"
  value       = local.instance_types[terraform.workspace]
}
