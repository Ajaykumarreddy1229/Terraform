terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "ssh" {
  name = "${var.instance_name}-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "apache" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ssh.id]

  tags = {
    Name = var.instance_name
  }

  provisioner "file" {
    source      = "${path.module}/remote_script.sh"
    destination = "/tmp/remote_script.sh"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(pathexpand(var.private_key_path))
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/remote_script.sh",
      "sudo /tmp/remote_script.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(pathexpand(var.private_key_path))
      host        = self.public_ip
    }
  }
}

output "instance_public_ip" {
  value = aws_instance.apache.public_ip
}
