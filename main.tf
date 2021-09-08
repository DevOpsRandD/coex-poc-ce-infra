# VPC
module "chaos_engineering_network" {
  source = "./modules/vpc"

  vpc_name = var.app_name
  config   = var.vpc_config
}
