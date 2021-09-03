resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name    = var.vpc_name
    Project = var.project
  }
}


## Private Subnets

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


## Public Subnets

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



## Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name    = format("%s-igw", var.vpc_name)
    Project = var.project
  }
}


## Route Tables

resource "aws_route_table" "priv-nodes-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = format("%s-priv-nodes", var.vpc_name)
    Project = var.project
  }
}


resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = format("%s-public", var.vpc_name)
    Project = var.project
  }
}



## Route table associations

### Private Routes
resource "aws_route_table_association" "priv-1-subnet-association" {
  subnet_id      = aws_subnet.priv_1.id
  route_table_id = aws_route_table.priv-nodes-rt.id
}

resource "aws_route_table_association" "priv-2-subnet-association" {
  subnet_id      = aws_subnet.priv_2.id
  route_table_id = aws_route_table.priv-nodes-rt.id
}

resource "aws_route_table_association" "priv-3-subnet-association" {
  subnet_id      = aws_subnet.priv_3.id
  route_table_id = aws_route_table.priv-nodes-rt.id
}


### Public Routes
resource "aws_route_table_association" "pub-1-subnet-association" {
  subnet_id      = aws_subnet.pub_1.id
  route_table_id = aws_route_table.pub-nodes-rt.id
}

resource "aws_route_table_association" "pub-2-subnet-association" {
  subnet_id      = aws_subnet.pub_2.id
  route_table_id = aws_route_table.pub-nodes-rt.id
}

resource "aws_route_table_association" "pub-3-subnet-association" {
  subnet_id      = aws_subnet.pub_3.id
  route_table_id = aws_route_table.pub-nodes-rt.id
}


