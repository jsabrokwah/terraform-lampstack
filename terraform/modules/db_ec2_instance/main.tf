resource "aws_instance" "db" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y mariadb-server
              systemctl start mariadb
              systemctl enable mariadb
              EOF

  tags = {
    Name = "${var.name_prefix}-db-instance"
  }
}
