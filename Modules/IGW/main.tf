# Internet Gateway
resource "aws_internet_gateway" "EKS-IGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = "EKS-IGW"
  }
}

# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.EKS-IGW.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_subnets" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index]
  route_table_id = aws_route_table.public.id
}