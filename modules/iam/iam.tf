resource "aws_iam_role" "rds_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.rds_trust_policy.json
}

resource "aws_iam_role_policy" "rds_secret_access" {
  role = aws_iam_role.rds_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "secretsmanager:GetSecretValue"
        Resource = var.secret_arn
      }
    ]
  })
}

data "aws_iam_policy_document" "rds_trust_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}
