output "aws_vpc_id" {
  value = aws_vpc.this.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "aws_route_table_public_id" {
  value = aws_route_table.public.id
}
