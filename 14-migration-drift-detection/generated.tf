resource "aws_instance" "example" {
  ami                         = "ami-0abcdef1234567890"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1a"
  key_name                    = "my-key"
  vpc_security_group_ids      = ["sg-0123456789abcdef0"]
  subnet_id                   = "subnet-0abcdef1234567890"
  tags = {
    Name = "ImportedInstance"
  }
}
