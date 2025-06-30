variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type = string
}

variable "security_group_id" {
  description = "Security group ID to associate with the instance"
  type = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type = string
}
