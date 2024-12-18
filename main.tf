provider "aws" {
  region = var.aws_region
}

module "networking" {
  source              = "./networking"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
}

module "security" {
  source   = "./security"
  vpc_id   = module.networking.vpc_id
  vpc_cidr = var.vpc_cidr
}

module "compute" {
  source                = "./compute"
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  public_subnet_id      = module.networking.public_subnet_id
  private_subnet_id     = module.networking.private_subnet_id
  public_sg_id          = module.security.public_sg_id
  private_sg_id         = module.security.private_sg_id
  key_name              = var.key_name
  consul_instance_count = var.consul_instance_count
}

module "loadbalancer" {
  source            = "./loadbalancer"
  vpc_id            = module.networking.vpc_id
  private_sg_id     = module.security.private_sg_id
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  vault_instance_id = module.compute.vault_instance_id
}
