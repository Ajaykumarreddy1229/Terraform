resource "aws_instance" "myinstance" {
    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = var.key_name

    tags = {
      Name = var.name
    }
}
