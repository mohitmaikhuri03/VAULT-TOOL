variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability zone for public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "Availability zone for private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
  default     = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = "key"
}

variable "consul_instance_count" {
  description = "Number of Consul instances"
  type        = number
  default     = 3
}
