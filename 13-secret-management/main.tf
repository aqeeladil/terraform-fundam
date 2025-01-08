# Define two providers in Terraform:
# AWS Provider (for creating infrastructure).
# Vault Provider (for accessing secrets).

provider "aws" {
  region = "us-east-1"
}

provider "vault" {
    address = "http://< EC2-public-IP>:8200"
    skip_tls_verify = true
}

# Authenticate Terraform with Vault
vault_approle_auth {
    role_id   = "<ROLE_ID>"
    secret_id = "<SECRET_ID>"
}

# Fetching Secrets
data "vault_kv_secret_v2" "example" {
  mount = "kv"       
  name  = "test-secret"      
}

# Use the fetched secret in an AWS EC2 instance’s tags
resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
