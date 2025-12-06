# Create KMS Key for DB encryption
resource "aws_kms_key" "db_encryption" {
  description             = "KMS key for DB password encryption"
  deletion_window_in_days = 10
}

# Create Secrets Manager secret for DB password
resource "aws_secretsmanager_secret" "db_password" {
  name       = "db_password"
  kms_key_id = aws_kms_key.db_encryption.id
}

# Create a new secret version with a dynamic password
resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = jsonencode({ password = var.db_password })  # Fetch password securely from a variable
}