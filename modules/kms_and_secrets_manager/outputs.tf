output "db_password_arn" {
  description = "The ARN of the database password secret"
  value       = aws_secretsmanager_secret.db_password.arn
}

output "kms_key_id" {
  description = "The KMS key ID used for DB encryption"
  value       = aws_kms_key.db_encryption.id
}
