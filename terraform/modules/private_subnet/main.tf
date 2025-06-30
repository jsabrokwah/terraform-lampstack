resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.name_prefix}-private-subnet-${count.index + 1}"
  }
}
