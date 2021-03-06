vpc_config = {
  cidr_block      = "10.100.0.0/19"
  aws_region      = "us-west-2"
  aws_azs         = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.100.0.0/21", "10.100.8.0/21", "10.100.16.0/21"]
  public_subnets  = ["10.100.24.0/22", "10.100.28.0/23", "10.100.30.0/23"]
}

ecr_repos = [
  "carts",
  "carts-db",
  "catalog",
  "catalog-db",
  "front-end",
  "orders",
  "orders-db",
  "payment",
  "queue-master",
  "rabbitmq",
  "session-db",
  "shipping",
  "user",
  "user-db"
]
