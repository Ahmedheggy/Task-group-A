output "rds_role_arn" {
  description = "The ARN of the RDS IAM role"
  value       = aws_iam_role.rds_role.arn
}
