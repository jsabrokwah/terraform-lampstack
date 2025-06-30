resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y php7.2
              yum install -y httpd mariadb
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "${var.name_prefix}-app-instance"
  }
}
