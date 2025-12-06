output "db_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.mysql.endpoint
}

output "db_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.mysql.arn
}
