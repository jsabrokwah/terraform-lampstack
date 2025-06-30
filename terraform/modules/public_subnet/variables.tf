variable "vpc_id" {
  description = "The VPC ID where subnets will be created"
  type = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type = list(string)
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type = string
}
