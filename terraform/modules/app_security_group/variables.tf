variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "web_sg_id" {
  description = "Security group ID of web tier"
  type        = string
}
