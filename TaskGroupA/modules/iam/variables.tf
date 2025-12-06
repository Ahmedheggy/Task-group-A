variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "secret_arn" {
  description = "The ARN of the secret in Secrets Manager"
  type        = string
}
