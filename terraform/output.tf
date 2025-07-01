output "web_instance_public_ip" {
  value = module.web_ec2_instance.public_ip
  description = "Public IP of the web EC2 instance"
}

output "app_instance_private_ip" {
  value       = module.app_ec2_instance.private_ip
  description = "Private IP of the app EC2 instance"
}

output "db_root_password" {
  value       = var.db_root_password
  description = "Root password for the database"
  sensitive   = true
}

output "db_host" {
  value       = module.db_ec2_instance.private_ip
  description = "Private IP of the database EC2 instance"
}
