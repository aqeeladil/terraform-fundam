variable "aws_region" {
  description = "AWS region where S3 buckets will be created"
  default     = "us-east-1"
}

variable "bucket1_name" {
  description = "Name of the first S3 bucket"
  default     = "my-first-bucket-${random_string.bucket1_suffix.result}"
}

variable "bucket2_name" {
  description = "Name of the second S3 bucket"
  default     = "my-second-bucket-${random_string.bucket2_suffix.result}"
}
