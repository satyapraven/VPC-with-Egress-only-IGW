# Public Subnet 2A
resource "aws_subnet" "public-subnet-2a" {
  vpc_id                          = var.vpc_id
  cidr_block                      = "10.0.1.0/24"
  availability_zone               = "${var.region}a"
  map_public_ip_on_launch        = true
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                = cidrsubnet(data.aws_vpc.selected.ipv6_cidr_block, 8, 1)

  tags = {
    Name = "PublicSubnet-2A"
  }
}

# Public Subnet 2B
resource "aws_subnet" "public-subnet-2b" {
  vpc_id                          = var.vpc_id
  cidr_block                      = "10.0.2.0/24"
  availability_zone               = "${var.region}c"
  map_public_ip_on_launch        = true
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                = cidrsubnet(data.aws_vpc.selected.ipv6_cidr_block, 8, 2)

  tags = {
    Name = "PublicSubnet-2B"
  }
}

# Private Subnet 2A
resource "aws_subnet" "private-subnet-2a" {
  vpc_id                          = var.vpc_id
  cidr_block                      = "10.0.10.0/24"
  availability_zone               = "${var.region}a"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                = cidrsubnet(data.aws_vpc.selected.ipv6_cidr_block, 8, 3)

  tags = {
    Name = "PrivateSubnet-2A"
  }
}

# Private Subnet 2B
resource "aws_subnet" "private-subnet-2b" {
  vpc_id                          = var.vpc_id
  cidr_block                      = "10.0.11.0/24"
  availability_zone               = "${var.region}c"
  assign_ipv6_address_on_creation = true
  ipv6_cidr_block                = cidrsubnet(data.aws_vpc.selected.ipv6_cidr_block, 8, 4)

  tags = {
    Name = "PrivateSubnet-2B"
  }
}

# Data source to get VPC details
data "aws_vpc" "selected" {
  id = var.vpc_id
}