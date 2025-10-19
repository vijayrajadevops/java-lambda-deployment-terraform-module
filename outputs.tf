output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.s3-nr-ingestor.function_arn
}

output "function_name" {
  description = "The name of the Lambda function"
  value       = module.s3-nr-ingestor.function_arn
}

output "lambda_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function"
  value       = module.s3-nr-ingestor.invoke_arn
}

output "kms_key_arn" {
  description = "(Optional) The ARN for the KMS encryption key"
  value       = module.s3-nr-ingestor.kms_key_arn
}

output "lambda_role_arn" {
  description = "ARN of the effective role used by Lambda"
  value       = aws_iam_role.lambda_execution.arn
}

output "lambda_role_name" {
  description = "Name of the role used by Lambda"
  value       = aws_iam_role.lambda_execution.name
}

output "log_group_name" {
  description = "Name of Lambda's CloudWatch log group"
  value       = module.s3-nr-ingestor.log_group_name
}

output "log_group_arn" {
  description = "ARN of Lambda's CloudWatch log group"
  value       = module.s3-nr-ingestor.log_group_arn
}
