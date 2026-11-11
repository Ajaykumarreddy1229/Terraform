output "instance_information" {
  value = [
    aws_instance.myinstance[*].public_ip,
    aws_instance.myinstance[*].private_ip,
    aws_instance.myinstance[*].public_dns
  ]
}
