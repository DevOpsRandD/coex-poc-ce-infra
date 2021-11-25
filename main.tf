# VPC
module "chaos_engineering_network" {
  source = "./modules/vpc"

  vpc_name = var.app_name
  config   = var.vpc_config
}

# IAM Role
module "eks_iam" {
  source = "./modules/eks_iam"
}

resource "aws_ecr_repository" "repositories" {
  for_each             = toset(var.ecr_repos)
  name                 = format("rand-%s", each.value)
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
