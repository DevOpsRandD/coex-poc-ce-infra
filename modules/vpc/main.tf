resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name    = var.vpc_name
    Project = var.project
  }
}

resource "aws_subnet" "priv_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_priv_1_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name    = format("%s-priv-1", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "priv_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_priv_2_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name    = format("%s-priv-2", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "priv_3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_priv_3_cidr
  availability_zone = "us-west-2c"
  tags = {
    Name    = format("%s-priv-3", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "pub_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_pub_1_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name    = format("%s-pub-1", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "pub_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_pub_1_cidr
  availability_zone = "us-west-2a"
  tags = {
    Name    = format("%s-pub-1", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "pub_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_pub_2_cidr
  availability_zone = "us-west-2b"
  tags = {
    Name    = format("%s-pub-2", var.vpc_name)
    Project = var.project
  }
}

resource "aws_subnet" "pub_3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.sub_pub_3_cidr
  availability_zone = "us-west-2c"
  tags = {
    Name    = format("%s-pub-3", var.vpc_name)
    Project = var.project
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = format("%s-igw", var.vpc_name)
    Project = var.project
  }
}


