locals {
  project_name   = "My-Awesome-DevOps"
  environment    = "Students"
  instance_count = 2

  tags = {
    Name        = "${local.project_name}-${local.environment}"
    Environment = local.environment
  }
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0492447090ced6eb5"
  instance_type = "t3.micro"
  count         = local.instance_count
  tags          = local.tags
}

output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.myinstance[*].id
}
