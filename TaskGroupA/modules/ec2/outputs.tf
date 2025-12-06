output "frontend_instance_id" {
  description = "The ID of the frontend EC2 instance"
  value       = aws_instance.frontend.id
}

output "frontend_public_ip" {
  description = "The public IP of the frontend EC2 instance"
  value       = aws_instance.frontend.public_ip
}

output "backend_instance_id" {
  description = "The ID of the backend EC2 instance"
  value       = aws_instance.backend.id
}

output "backend_public_ip" {
  description = "The public IP of the backend EC2 instance"
  value       = aws_instance.backend.public_ip
}

output "frontend_sg_id" {
  description = "The Security Group ID for frontend EC2 instance"
  value       = aws_security_group.frontend_sg.id
}

output "backend_sg_id" {
  description = "The Security Group ID for backend EC2 instance"
  value       = aws_security_group.backend_sg.id
}
