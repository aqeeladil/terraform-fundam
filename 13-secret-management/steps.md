# Integrating Terraform with HashiCorp Vault for Managing Secrets

## 1. Setting Up Vault on AWS

### Launch an EC2 Instance

- AMI: Ubuntu 20.04 LTS
- Instance Type: t2.micro
- Security Group: Allow inbound traffic on ports:
    - SSH (`22`)
    - Vault (`8200` HTTP)
- Attach an SSH key pair to access the instance.
- Once the instance is running, note its public IP address.
- SSH into the instance:
    `ssh -i <path-to-your-key.pem> ubuntu@<EC2-PUBLIC-IP>`

### Installing Vault

```bash
# Update and install necessary packages
sudo apt update
sudo apt install gpg

# Add the HashiCorp repository:
curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install vault
```

### Configuring Vault

```bash
# Vault can run in two modes: Development Server (Ideal for learning and testing, but data is not persistent, and it lacks production-level security) & Production Server (Requires configuration with TLS, certificates, and persistent storage. Development mode has no persistence. After a reboot, all data is erased).

# To start Vault using development server mode
vault server -dev 

# Copy the root token from the terminal output (you’ll need this later).
```

### Access Vault Web Interface

- Open your browser and go to `http://<EC2-PUBLIC-IP>:8200`.
- Log in using the root token.

## 2. Configuring Vault for Secrets Management

### Enabling the KV Secrets Engine

```bash
# A secrets engine is a plugin that defines how secrets are stored and accessed.
# Key-Value (KV): Stores static secrets like usernames and passwords.
# Other engines include AWS, Azure, or Kubernetes secrets.

# Enable the KV engine:
# In the Vault UI: Go to Secrets Engines → Enable New Engine.
# Select KV (Key-Value) and set the path to kv.
# Alternatively, via the CLI:
vault secrets enable -path=kv kv

# Add a secret to the KV engine:
# In the Vault UI: Navigate to kv → Create Secret.
# Add a secret with: Key: username, Value: Aqeel.
# Alternatively, via the CLI:
vault kv put kv/test-secret username="Aqeel" password="mypassword"
```

### AppRole Authentication

```bash
# AppRole is a Vault authentication method similar to AWS IAM roles. It allows external tools like Terraform to access Vault securely.

# Enable AppRole Authentication:
vault auth enable approle

# Apply Policy
vault policy write terraform terraform-policy.hcl
```
```bash
# Create an AppRole:

vault write auth/approle/role/terraform \
    token_policies="terraform" \
    secret_id_ttl=60m \
    token_ttl=60m \
    token_max_ttl=120m

```
```bash
# Generate Role ID and Secret ID:
# The Role ID is a static identifier, while the Secret ID is a dynamic credential.

vault read auth/approle/role/terraform/role-id

vault write -force auth/approle/role/terraform/secret-id
```

## 3. Configuring Terraform

```bash
mkdir terraform-vault-demo
cd terraform-vault-demo

terraform init
terraform validate
terraform apply

# Confirm the resources in AWS:
# Navigate to the AWS EC2 console. Check the tags of the created instance for Secret: Aqeel.
```

