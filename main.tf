terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# VPC

module "chaos_engineering_network" {
  source          = "./modules/vpc"
  cidr_block      = "10.100.0.0/19"
  vpc_name        = "chaos-eng-poc"
  project         = "res-and-dev-chaos-engineering"
  sub_priv_1_cidr = "10.100.0.0/21"
  sub_priv_2_cidr = "10.100.8.0/21"
  sub_priv_3_cidr = "10.100.16.0/21"
}
