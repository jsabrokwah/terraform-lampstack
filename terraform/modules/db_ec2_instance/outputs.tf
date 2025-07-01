output "private_ip" {
  description = "Private IP address of the database EC2 instance"
  value       = aws_instance.db.private_ip
}
