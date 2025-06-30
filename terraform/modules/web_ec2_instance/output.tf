output "public_ip" {
  value = aws_instance.web.public_ip
  description = "Public IP address of the web EC2 instance"
}
