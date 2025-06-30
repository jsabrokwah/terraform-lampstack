resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.name_prefix}-public-subnet-${count.index + 1}"
  }
}
