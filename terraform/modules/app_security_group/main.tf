resource "aws_security_group" "app_sg" {
  name        = "${var.name_prefix}-app-sg"
  description = "Security group for app tier"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from web tier"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.web_sg_id]
  }

  ingress {
    description = "Allow SSH from web tier"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [var.web_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-app-sg"
  }
}
