# Creating two S3 buckets on AWS platform using Terraform

## Install Terraform and AWS CLI (Ubuntu Machine):
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y wget curl unzip gnupg software-properties-common

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install terraform -y
terraform -version
```
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
aws --version

aws configure
```

## Workflow
```bash
# Initialize Terraform
git clone https://github.com/aqeeladil/terraform-fundam.git
cd 08-aws-s3-bucket-creation
terraform init

# Validate the Configuration
terraform validate

# Preview the Resources
terraform plan

# Create the resources on AWS.
terraform apply

# View the output
terraform output

# Verify using Aws CLI
aws s3 ls

# To delete the resources
terraform destroy
```






