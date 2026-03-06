# main.tf

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  project_name    = var.project_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ec2" {
  source = "./modules/ec2"

  instance_count = var.instance_count
  instance_type  = var.instance_type
  ami_id         = var.ami_id
  subnet_id      = module.vpc.public_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
}

module "alb" {
  source = "./modules/alb"

  alb_name              = var.alb_name
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  health_check_path     = var.health_check_path
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = var.repository_name
}
