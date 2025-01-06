# Creating an Ec2 Instance on Aws using Terraform

### 1. Create configuration file (`main.tf`)

- Create a directory for your Terraform project
- Create a Terraform configuration file (usually named `main.tf`) in that directory. 
- In this file, you define the AWS provider and resources you want to create. 

```hcl
# Define the provider (AWS in this case):

provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

# Define an EC2 instance resource:

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"  # Replace with the latest AMI ID for your region
    instance_type = "t2.micro"

    tags = {
    Name = "MyTerraformInstance"

    subnet_id = "subnet-xxxxxxxx"  # Replace with your subnet ID

    key_name = "my-key-pair"  # Replace with your key pair name
  }
}
```

### 2. Initialize Terraform

```bash
# In your terminal, navigate to the directory containing your Terraform configuration files and run

terraform init

# This command initializes the Terraform working directory, downloading any necessary provider plugins.
```

### 3. Review the execution plan:

```bash
terraform plan
```

### 4. Apply the changes to your infrastructure

```bash
# Run the following command to create the AWS resources defined in your Terraform configuration:

terraform apply

# Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.
```

### 5. Verify Resources

After Terraform completes the provisioning process, you can verify the resources created in the AWS Management Console or by using AWS CLI commands.

### 6. View Output

```bash
terraform output
```

### 7. Manage

Make future updates to your configuration files, run ```terraform plan``` again, and then ```terraform apply``` to implement the changes.

### 8. Destroy Resources

```bash
If you want to remove the resources created by Terraform, you can use the following command:

terraform destroy

# Be cautious when using `terraform destroy` as it will delete resources as specified in your Terraform configuration.
```

### 9. Add Variables for Reusability (Optional)

To make your configuration more flexible, use variables.

1. **Update `main.tf`**:

2. **Create a `terraform.tfvars` file:**

3. **Re-run the commands:**
```bash
terraform plan
terraform apply
```