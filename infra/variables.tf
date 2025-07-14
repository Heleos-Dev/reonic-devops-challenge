variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "lambda_container_image" {
  description = "ECR container image URI for Lambda"
  type        = string
}

variable "db_username" {
  description = "RDS database username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}
