variable "vpc_cidr" {
  description = "CIDR block for the VPC"
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

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type = list(string)
}
