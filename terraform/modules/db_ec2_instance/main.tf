resource "aws_instance" "db" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  security_groups = [var.security_group_id]

  user_data = templatefile("${path.module}/userdata-db.sh", {
    DB_ROOT_PASSWORD = var.db_root_password
  })

  tags = {
    Name = "${var.name_prefix}-db-instance"
  }
}
