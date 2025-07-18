output "instance_id" {
  value = aws_instance.ubuntu_server.id
}

output "public_ip" {
  value = aws_instance.ubuntu_server.public_ip
}
