terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-123456"  # Same as the bucket name in main.tf
    key            = "terraform.tfstate"
    region         = "us-east-1"  # Same region as in provider.tf
    dynamodb_table = "terraform-lock-table"  # Same name as the DynamoDB table
    encrypt        = true
  }
}
