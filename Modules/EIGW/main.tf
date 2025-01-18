# Create an Egress-Only Internet Gateway
resource "aws_egress_only_internet_gateway" "EKS-EIGW" {
  vpc_id = var.vpc_id

  tags = {
    Name = "EKS-EIGW"
  }
}

# Route Table for Private Subnets
resource "aws_route_table" "private-route" {
  vpc_id = var.vpc_id

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.EKS-EIGW.id
  }

  tags = {
    Name = "PrivateRouteTable"
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private-association" {
  count          = length(var.private_subnets)
  subnet_id      = var.private_subnets[count.index]
  route_table_id = aws_route_table.private-route.id
}