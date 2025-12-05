# VPC ID output - used by other modules (EC2 / RDS) to attach resources to the same network
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

# Public subnet IDs for frontend/backend EC2 instances
output "public_subnet_id" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

# Private subnet IDs for the RDS instance
output "private_subnet_id" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}
