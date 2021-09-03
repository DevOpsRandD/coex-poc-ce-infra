variable "app_name" {
  type        = string
  description = "Name of the application"
  default     = "chaos-eng-poc"
}

variable "vpc_config" {
  type = object({
    cidr_block      = string
    aws_region      = string
    aws_azs         = list(string)
    private_subnets = list(string)
    public_subnets  = list(string)
  })
}
