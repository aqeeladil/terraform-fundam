# Automating the creation of a Web Application Infrastructure using Terraform on AWS.

## Project Architecture

- A VPC with:

    - Two public subnets across different availability zones.

    - An Internet Gateway to allow internet access.

    - Route tables to direct traffic through the gateway.

- Security Groups to control inbound and outbound traffic.

- EC2 Instances deployed in the public subnets, each running a web server.

- Application Load Balancer (ALB) to distribute traffic across the EC2 instances.

- S3 Bucket (optional) for storing files or static content.

## Implementation

```bash
terraform init

terraform validate

terraform plan

terraform apply
```