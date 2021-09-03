resource "aws_vpc" "vpc" {
  cidr_block = var.config.cidr_block
  tags = {
    Name = var.vpc_name
  }
}


## Private Subnets
resource "aws_subnet" "private_subnets" {
  count             = length(var.config.aws_azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.config.private_subnets[count.index]
  availability_zone = var.config.aws_azs[count.index]

  tags = {
    Name = format("%s-priv-%s", var.vpc_name, count.index)
  }
}

## Public Subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.config.aws_azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.config.public_subnets[count.index]
  availability_zone = var.config.aws_azs[count.index]

  tags = {
    Name = format("%s-pub-%s", var.vpc_name, count.index)
  }
}

## Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("%s-igw", var.vpc_name)
  }
}


## Route Tables
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-priv-nodes", var.vpc_name)
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = format("%s-public", var.vpc_name)
  }
}



## Route table associations

### Private Routes
resource "aws_route_table_association" "priv_subnet_association" {
  count          = length(var.config.aws_azs)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

### Public Routes
resource "aws_route_table_association" "pub_subnet_association" {
  count          = length(var.config.aws_azs)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
