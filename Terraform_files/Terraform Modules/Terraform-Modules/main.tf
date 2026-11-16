
terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
  environment  = var.environment
}

module "ec2" {
  source = "./modules/ec2-instances"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
  environment   = var.environment
}

module "s3" {
  source = "./modules/s3-bucket"

  bucket_name = var.bucket_name
  environment = var.environment
}
