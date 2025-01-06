
output "public-ip-address" {
  description = "The public IP of the EC2 instance"
  value = aws_instance.example.public_ip
}