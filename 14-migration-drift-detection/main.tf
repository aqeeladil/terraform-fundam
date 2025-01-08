provider "aws" {
  region = "us-east-1"
}


# Use the import block if your Terraform version supports it (from version 1.5 onwards)

resource "aws_instance" "example" {
  # Fields will be filled during the import process.
}

import {
  to = aws_instance.example
  id = "i-0abcd1234efgh5678" # Replace with the instance ID
}
