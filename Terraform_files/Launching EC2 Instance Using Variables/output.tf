output "instance_public_ip" {
    value = aws_instance.myinstance.public_ip
    sensitive = true
}

output "instance_id"{
    value = aws_instance.myinstance.id
}

output "instance_public_dns" {
    value = aws_instance.myinstance.public_dns
}

output "instance_arn" {
    value = aws_instance.myinstance.arn
}
