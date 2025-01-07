## Automate the setup of an environment for testing application changes using Terraform. 

### Scenario Overview:

- The development team modifies `app.py` (a Python Flask application) and wants the DevOps team to quickly test these changes in an isolated environment.

- Use Terraform to automate creating the testing environment, including:

  - A VPC with a public subnet.
  - An EC2 instance with a public IP.
  - Deployment of the app to the EC2 instance.

- This involves two parts:

  - Setting up the Infrastructure: Terraform’s primary function.
  - Deploying and Running the App: Achieved using provisioners.

### Execution Commands:

```bash
# Create an SSH key pair to access your EC2 instance:
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
# Save the key as ~/.ssh/id_rsa (default location).

# The AWS user must have the necessary permissions to create VPCs, subnets, EC2 instances, etc.

# Apply terraform commands
terraform init
terraform plan
terraform apply

# Verify the execution on remote instance
# Log in to the EC2 instance:
ssh -i ~/.ssh/id_rsa ubuntu@<public-ip>

# Check the File: Verify that `app.py` exists at `/home/ubuntu/`.

# Check Flask Installation
pip3 show flask
# If Flask is not installed, re-run:
pip3 install flask

# Check if Flask is installed and the `app.py` script is running:
python3 app.py
# If not, execute manually:
python3 /home/ubuntu/app.py

# Access the EC2 instance's public IP on port 80 using a browser or curl.
```