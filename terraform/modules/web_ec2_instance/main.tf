resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  user_data = templatefile("${path.module}/userdata-web.sh", {
    APP_INSTANCE_PRIVATE_IP = var.app_instance_private_ip
  })

  tags = {
    Name = "${var.name_prefix}-web-instance"
  }
}
