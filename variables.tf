# ===== CUSTOM VARS ============================================================
variable "function_timeout_seconds" {
  type        = number
  description = "Number of seconds until the Lambda function times out"
  default     = 60
}

variable "function_memory_size_mb" {
  type        = number
  description = "Amount of memory in MB to assign to the Lambda function"
  default     = 128
}

variable "bucket_name" {
  type        = string
  description = "The name (Not ARN) of the bucket you wish to allow access to invoke the function"
}

variable "secret_name" {
  type        = string
  description = "The name (Not ARN) of the secret to store new relic credentials"
}

variable "region" {
  type        = string
  description = "AWS region in which resources will be created (used by the AWS provider)."
}

variable "artifact_dir" {
  type        = string
  description = "jar archive file location."
}

variable "isRootModule" {
  type        = bool
  description = "Set true when the module is run as a root module. Mostly for terratest"
  default     = false
}

variable "handler" {
  type        = string
  description = "handler for the lambda function"
}

variable "archive_filename" {
  type        = string
  description = "zip archive filename"
}

variable "object_filter_prefix" {
  type        = string
  description = "object prefix filter in s3 to invoke lambda function"
}

