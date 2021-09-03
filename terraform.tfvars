vpc_config = {
  cidr_block      = "10.100.0.0/21"
  aws_region      = "us-west-2"
  aws_azs         = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.100.0.0/21", "10.100.8.0/21", "10.100.16.0/21"]
  public_subnets  = ["10.100.24.0/22", "10.100.28.0/23", "10.100.30.0/23"]
}
