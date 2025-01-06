provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
}

# Define variables
variable "region" {}
variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "key_name" {}