# Variables | `.tfvars`

Input and output variables in Terraform are essential for parameterizing and sharing values within your Terraform configurations and modules. They allow you to make your configurations more dynamic, reusable, and flexible.

## Input Variables

Input variables are used to parameterize your Terraform configurations. They allow you to pass values into your modules or configurations from the outside. Input variables can be defined within a module or at the root level of your configuration. 

Here's how you define an input variable:

```hcl
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = var.instance_type
}
```
```bash
# To Dynamically Override the above configuration

terraform apply -var="instance_type=t2.medium"
```

## Output Variables

Output variables allow Terraform to return data after deployment. They are useful for displaying information like IP addresses, DNS names, etc. This allow you to expose values from your module or configuration. This allows you to share data and values between different parts of your Terraform configuration and create more modular and maintainable infrastructure-as-code setups.

Here's how you define an output variable:

```hcl
output "public_ip" {
  value = aws_instance.example.public_ip
}

# When you run `terraform apply`, the `public_ip` will be displayed.
```

## Example

```hcl

# 1. Define an input variable for the EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# 2. Define an input variable for the EC2 instance AMI ID
variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}

# 3. Configure the AWS provider using the input variables
provider "aws" {
  region      = "us-east-1"
}

# 4. Create an EC2 instance using the input variables
resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

# 5. Define an output variable to expose the public IP address of the EC2 instance.
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example_instance.public_ip
}

```

## Terraform tfvars

In Terraform, `.tfvars` files (typically with a `.tfvars` extension) are used to set specific values for input variables defined in your Terraform configuration. 

They allow you to separate configuration values from your Terraform code, making it easier to manage different configurations for different environments (e.g., development, staging, production) or to store sensitive information without exposing it in your code.

Here's the purpose of `.tfvars` files:

1. **Separation of Configuration from Code**: Input variables in Terraform are meant to be configurable so that you can use the same code with different sets of values. Instead of hardcoding these values directly into your `.tf` files, you use `.tfvars` files to keep the configuration separate. This makes it easier to maintain and manage configurations for different environments.

2. **Sensitive Information**: `.tfvars` files are a common place to store sensitive information like API keys, access credentials, or secrets. These sensitive values can be kept outside the version control system, enhancing security and preventing accidental exposure of secrets in your codebase.

3. **Reusability**: By keeping configuration values in separate `.tfvars` files, you can reuse the same Terraform code with different sets of variables. This is useful for creating infrastructure for different projects or environments using a single set of Terraform modules.

4. **Collaboration**: When working in a team, each team member can have their own `.tfvars` file to set values specific to their environment or workflow. This avoids conflicts in the codebase when multiple people are working on the same Terraform project.

## Example

Here's how you typically use `.tfvars` files

1. Define your input variables in your Terraform code (e.g., in a `variables.tf` file).

2. Create one or more `.tfvars` files, each containing specific values for those input variables.

3. When running Terraform commands (e.g., terraform apply, terraform plan), you can specify which .tfvars file(s) to use with the -var-file option:

  `terraform apply -var-file=dev.tfvars`

By using `.tfvars` files, you can keep your Terraform code more generic and flexible while tailoring configurations to different scenarios and environments.