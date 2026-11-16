
variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "bucket_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}
