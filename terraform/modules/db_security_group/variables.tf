variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "app_sg_id" {
  description = "Security group ID of app tier"
  type        = string
}
