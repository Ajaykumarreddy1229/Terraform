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
  default = "terraform-user-data"
}

variable "http_allowed_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
