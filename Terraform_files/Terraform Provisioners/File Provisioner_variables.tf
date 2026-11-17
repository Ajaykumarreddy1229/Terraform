variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_name" {
  type    = string
  default = "terraform-file-provisioner"
}

variable "key_pair_name" {
  type = string
}

variable "private_key_path" {
  type      = string
  sensitive = true
}

variable "allowed_ssh_cidr" {
  type = string
}
