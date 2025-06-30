variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.121.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.122.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-central-1a"]
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = "TerraformLampstack"
}

variable "web_instance_type" {
  description = "EC2 instance type for web tier"
  type        = string
  default     = "t2.micro"
}

variable "web_ami_id" {
  description = "AMI ID for web EC2 instance"
  type        = string
  default     = "ami-003c9adf81de74b40" # Amazon Linux 2 AMI (example)
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "terraform-lampstack"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the public EC2 instance"
  type        = string
  default     = "0.0.0.0/0"
}
