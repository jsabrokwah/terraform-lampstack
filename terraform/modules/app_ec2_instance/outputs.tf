output "private_ip" {
  description = "Private IP address of the app EC2 instance"
  value       = aws_instance.app.private_ip
}
