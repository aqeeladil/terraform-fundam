## Setup Terraform for AWS

To configure AWS credentials and set up Terraform to work with AWS, you'll need to follow these steps:

### 1. Install AWS CLI (Command Line Interface):

```bash
# Update system and install required tools
sudo apt update && sudo apt upgrade -y
sudo apt install curl unzip 

# Install Cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Verify
aws --version

# Configure AWS CLI Credentials
aws configure

# It will prompt you to enter your AWS Access Key ID, Secret Access Key, default region, and default output format. Enter the credentials you obtained in the previous step.
```

### 2. Create an AWS IAM User:

To interact with AWS programmatically, you should create an IAM (Identity and Access Management) user with appropriate permissions. Here's how to create one:

1. Log in to the AWS Management Console with an account that has administrative privileges.

2. Navigate to the IAM service.

3. Click on "Users" in the left navigation pane and then click "Add user."

4. Choose a username, select "Programmatic access" as the access type, and click "Next: Permissions."

5. Attach policies to this user based on your requirements. At a minimum, you should attach the "AmazonEC2FullAccess" policy for basic EC2 operations. If you need access to other AWS services, attach the relevant policies accordingly.

6. Review the user's configuration and create the user. Be sure to save the Access Key ID and Secret Access Key that are displayed after user creation; you'll need these for Terraform.



