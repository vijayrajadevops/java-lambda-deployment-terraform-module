module "s3-nr-ingestor" {
  source = "github.com/vc-ccs-tf-components/aws-lambda?ref=v0.6.33"

  providers = {
    aws = aws
  }

  # Common Variables
  org = var.org
  env = var.env

  # Function variables
  function_name = "s3-nr-ingestor-${var.env}"
  description   = "Lambda function to ingest data from s3 to newrelic"
  zip           = "${local.archive_file}"
  handler       = var.handler
  runtime       = "java11"
  memory_size   = var.function_memory_size_mb
  timeout       = var.function_timeout_seconds

  # VPC Variables
  vpc_enabled = true
  vpc_id      = module.aws_vpc.core_vpc_id
  subnet_ids  = slice(module.aws_vpc.core_private_az_subnets, 0, 2)

lambda_egress_rules = [
  {
    description   = "Allow all outbound traffic via NAT Gateway"
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }
]



  # Role Variables
  role_arn = aws_iam_role.lambda_execution.arn

  # Log Variables
  log_retention_in_days = 30

  #env_vars
  env_variables = {
    "ARN_SECRET_NAME" = module.newrelic_secret.arn
  }

  # Tags
  tags = module.tags.tags
}

# Permission that authorizes a specific S3 bucket to invoke this function
resource "aws_lambda_permission" "lambda_permission" {
  action         = "lambda:InvokeFunction"
  function_name  = module.s3-nr-ingestor.function_name
  principal      = "s3.amazonaws.com"
  source_account = local.current_account_id
  source_arn     = "arn:aws:s3:::${var.bucket_name}"
  statement_id   = "${var.bucket_name}-Invoke"
}

# Trigger to invoke lambda function
resource "aws_s3_bucket_notification" "s3_upload_trigger" {
  bucket = data.aws_s3_bucket.json_bucket.bucket

  lambda_function {
    lambda_function_arn = module.s3-nr-ingestor.function_arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.object_filter_prefix
    filter_suffix       = ".json"
  }

  depends_on = [
    aws_lambda_permission.lambda_permission
  ]
}

data "aws_s3_bucket" "json_bucket" {
  bucket = var.bucket_name
}

