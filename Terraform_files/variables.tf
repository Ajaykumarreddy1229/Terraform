variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "instance_ami" {
  description = "AMI ID of EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_name" {
  description = "Name of EC2 instance"
  type        = string
}
