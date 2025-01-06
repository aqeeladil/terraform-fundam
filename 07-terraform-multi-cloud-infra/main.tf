# AWS Instance in US-East-1

resource "aws_instance" "east_instance" {
  provider      = aws.east
  ami           = var.aws_ami
  instance_type = var.aws_instance_type

  tags = {
    Name = "East Instance"
    Env  = var.environment
  }
}

# AWS Instance in US-West-2

resource "aws_instance" "west_instance" {
  provider      = aws.west
  ami           = var.aws_ami
  instance_type = var.aws_instance_type

  tags = {
    Name = "West Instance"
    Env  = var.environment
  }
}

# Azure Virtual Machine

resource "azurerm_virtual_machine" "azure_vm" {
  name                  = "AzureVM"
  location              = "East US"
  resource_group_name   = "example-resources"
  vm_size               = "Standard_DS1_v2"

  tags = {
    Env = var.environment
  }
}

# S3 Bucket with Conditional Public Access
resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-terraform-bucket"

  acl = var.environment == "production" ? "private" : "public-read"

  tags = {
    Name = "ExampleBucket"
    Env  = var.environment
  }
}
