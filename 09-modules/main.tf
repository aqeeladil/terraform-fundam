provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = var.ami_value
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

