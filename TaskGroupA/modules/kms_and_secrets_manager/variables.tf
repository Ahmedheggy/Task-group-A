variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true  # Terraform will not show password value in any output
}
