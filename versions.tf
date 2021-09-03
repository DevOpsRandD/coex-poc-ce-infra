terraform {
  backend "s3" {
    bucket = "coex-rand-terraform-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      Environment = "poc"
      Project     = "res-and-dev-chaos-engineering"
    }
  }
}
