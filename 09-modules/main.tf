provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type = "t2.micro"
  subnet_id = "subnet-019ea91ed9b5252e7". # replace this
}

