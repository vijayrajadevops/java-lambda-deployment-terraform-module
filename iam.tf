# Execution Role for Lambda
resource "aws_iam_role" "lambda_execution" {
  name        = "lambda-execute-s3-nr-ingestor-${var.env}"
  description = "Lambda execution role for processing S3 objects"

  # Trust policy allows Lambda service to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  # Baseline permissions for Lambda VPC access and CloudWatch Logs
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"       

  ]

  tags = module.tags.tags
}

# Inline policy to allow Lambda to read objects in the bucket
resource "aws_iam_role_policy" "lambda_s3_access" {
  name = "lambda_s3_access"
  role = aws_iam_role.lambda_execution.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}"
      }
    ]
  })
}


# Inline policy to allow Lambda to access the Secrets Manager secret
resource "aws_iam_role_policy" "lambda_secret_access" {
  name = "lambda_secret_access"
  role = aws_iam_role.lambda_execution.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = [
          "arn:aws:secretsmanager:us-east-1:${local.current_account_id}:secret:paramount-mso-newrelic-dev*"
        ]
      }
    ]
  })
}
