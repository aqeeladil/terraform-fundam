resource "random_string" "bucket1_suffix" {
  length  = 8
  special = false
}

resource "random_string" "bucket2_suffix" {
  length  = 8
  special = false
}

resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket1_name
  acl    = "private"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = var.bucket2_name
  acl    = "private"
}
