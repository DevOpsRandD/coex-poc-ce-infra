resource "aws_eks_cluster" "chaos_engineering_cluster" {
  name     = "chaos-engineering"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}
