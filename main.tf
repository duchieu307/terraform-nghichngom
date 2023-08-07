terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}


module "vpc" {
  source                 = "./modules/vpc"
  env                    = var.env
  project_name           = var.project_name
  vpc_cidr_block         = var.vpc_cidr_block
  public_subnet_numbers  = var.public_subnet_numbers
  private_subnet_numbers = var.private_subnet_numbers
}

module "ec2" {
  source       = "./modules/ec2"
  env          = var.env
  project_name = var.project_name
  # availability_zone  = var.availability_zone
  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  public_subnet_id  = element(module.vpc.public_subnet_ids, 0)
  vpc_id            = module.vpc.vpc_id
  public_key        = var.public_key
}


module "database" {
  source                  = "./modules/database"
  env                     = var.env
  project_name            = var.project_name
  availability_zone       = var.availability_zone
  db_allocated_storage    = var.db_allocated_storage
  db_name                 = var.db_name
  db_engine               = var.db_engine
  db_engine_version       = var.db_engine_version
  db_instance_class       = var.db_instance_class
  db_username             = var.db_username
  db_password             = var.db_password
  db_parameter_group_name = var.db_parameter_group_name
  private_subnet_ids      = module.vpc.private_subnet_ids
  vpc_id                  = module.vpc.vpc_id
  db_port                 = var.db_port
  ec2_sg                  = module.ec2.ec2_sg
}

module "elastic-cache" {
  source                     = "./modules/elastic-cache"
  availability_zone          = var.availability_zone
  env                        = var.env
  project_name               = var.project_name
  cache_cluster_id           = var.cache_cluster_id
  cache_num_cache_nodes      = var.cache_num_cache_nodes
  cache_engine               = var.cache_engine
  cache_node_type            = var.cache_node_type
  cache_parameter_group_name = var.cache_parameter_group_name
  cache_engine_version       = var.cache_engine_version
  cache_port                 = var.cache_port
  private_subnet_ids         = module.vpc.private_subnet_ids
  vpc_id                     = module.vpc.vpc_id
  ec2_sg                     = module.ec2.ec2_sg

}


