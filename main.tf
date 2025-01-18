provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./Modules/VPC"
}

module "subnets" {
  source = "./Modules/subnets"
  vpc_id = module.vpc.vpc_id
  region = var.aws_region
}

module "IGW" {
  source         = "./Modules/IGW"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.subnets.public_subnet_ids
}

module "EIGW" {
  source          = "./Modules/EIGW"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.subnets.private_subnet_ids
}