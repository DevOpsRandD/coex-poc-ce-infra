output "private_subnet_id" {
  value = module.chaos_engineering_network.private_subnet_id
}

output "eks_role_arn" {
  value = module.eks_iam.role_arn
}
