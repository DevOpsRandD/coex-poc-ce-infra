# VPC
module "chaos_engineering_network" {
  source = "./modules/vpc"

  vpc_name = var.app_name
  config   = var.vpc_config
}

# IAM
module "eks_iam" {
  source = "./modules/iam"
}

# EKS
module "eks" {
  source     = "./modules/eks"
  subnet_ids = module.chaos_engineering_network.private_subnet_id
  role_arn   = module.eks_iam.role_arn
}
