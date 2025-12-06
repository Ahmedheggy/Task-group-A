# Provider Configuration
provider "aws" {
  region = var.aws_region
}


module "network" {
  source = "../../modules/network" # Adjusted path since we are in environments/dev
  environment = var.environment
  vpc_cidr = var.vpc_cidr
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  azs = var.azs
}

module "ec2" {
  source = "../../modules/ec2"
  environment = var.environment
  vpc_id = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_id
  instance_type = var.instance_type
  ssh_key_name = var.ssh_key_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "kms_and_secrets_manager" {
  source = "../../modules/kms_and_secrets_manager"
  db_password = var.db_password
}

module "rds" {
  source = "../../modules/rds"
  environment = var.environment
  private_subnet_ids = module.network.private_subnet_id
  backend_sg_id = module.ec2.backend_sg_id
  kms_key_id = module.kms_and_secrets_manager.kms_key_id
  db_password = var.db_password
}

module "cloudwatch" {
  source = "../../modules/cloudwatch"
  instance_ids = [module.ec2.frontend_instance_id, module.ec2.backend_instance_id]
  email = var.email
}

module "iam" {
  source = "../../modules/iam"
  secret_arn = module.kms_and_secrets_manager.db_password_arn
  role_name  = "rds_role"
}
