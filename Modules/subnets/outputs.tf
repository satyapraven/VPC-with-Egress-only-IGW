output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public-subnet-2a.id, aws_subnet.public-subnet-2b.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [aws_subnet.private-subnet-2a.id, aws_subnet.private-subnet-2b.id]
}