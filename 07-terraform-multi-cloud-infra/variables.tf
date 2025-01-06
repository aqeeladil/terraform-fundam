# AWS Instance Variables

variable "aws_instance_type" {
  description = "Type of AWS EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_ami" {
  description = "AWS AMI ID"
  type        = string
}

# Environment Variable

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
