output "web_instance_public_ip" {
  value = module.web_ec2_instance.public_ip
  description = "Public IP of the web EC2 instance"
}
