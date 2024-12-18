variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability zone for public subnet"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability zone for private subnet"
  type        = string
}
