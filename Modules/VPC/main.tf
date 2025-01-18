# Create VPC
resource "aws_vpc" "EKS-VPC" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_support               = true
  enable_dns_hostnames             = true
  instance_tenancy                 = "default"

  tags = {
    Name = "EKS-VPC"
    Environment = "Production"
  }
}