provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-123456"  # Globally unique bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = "Terraform-Backend"
    Purpose     = "State Storage"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {       # (terraform-lock) to manage state locking
  name           = "terraform-lock-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Environment = "Terraform-Backend"
    Purpose     = "State Locking"
  }
}
