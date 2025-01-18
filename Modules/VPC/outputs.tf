# VPC ID Output
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.EKS-VPC.id
}

# VPC CIDR Block Output
output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.EKS-VPC.cidr_block
}

# VPC IPv6 CIDR Block Output
output "vpc_ipv6_cidr" {
  description = "The IPv6 CIDR block of the VPC"
  value       = aws_vpc.EKS-VPC.ipv6_cidr_block
}

# VPC ARN Output
output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = aws_vpc.EKS-VPC.arn
}

# VPC Default Security Group Output
output "vpc_default_security_group_id" {
  description = "The ID of the VPC's default security group"
  value       = aws_vpc.EKS-VPC.default_security_group_id
}