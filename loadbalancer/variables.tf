variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_sg_id" {
  description = "Private security group ID"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}

variable "vault_instance_id" {
  description = "Vault instance ID"
  type        = string
}
