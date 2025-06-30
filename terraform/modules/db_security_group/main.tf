resource "aws_security_group" "db_sg" {
  name        = "${var.name_prefix}-db-sg"
  description = "Security group for db tier"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow MySQL from app tier"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.app_sg_id]
  }

  ingress {
    description = "Allow SSH from app tier"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.app_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-db-sg"
  }
}
