# Ways to Secure Terraform

There are a few ways to manage sensitive information in Terraform files. Here are some of the most common methods:

## 1. Sensitive Attribute

Terraform provides a sensitive attribute that can be used to mark variables and outputs as sensitive. When a variable or output is marked as sensitive, Terraform will not print its value in the console output or in the state file.

**For example:** To mark a variable as sensitive, you would add the sensitive attribute to the variable declaration. 

```hcl
variable "aws_access_key_id" {
  sensitive = true
}
```

## 2. Secret management system

Store sensitive data in a secret management system. A secret management system is a dedicated system for storing sensitive data, such as passwords, API keys, and SSH keys. Terraform can be configured to read secrets from a secret management system, such as HashiCorp Vault or AWS Secrets Manager.

To store sensitive data in a secret management system, you would first create a secret in the secret management system. Then, you would configure Terraform to read the secret from the secret management system. 

**For example**, to read a secret from HashiCorp Vault, you would use the vault_generic_secret data source.

```hcl
data "vault_generic_secret" "aws_access_key_id" {
  path = "secret/aws/access_key_id"
}

variable "aws_access_key_id" {
  value = data.vault_generic_secret.aws_access_key_id.value
}
```

## 3. Remote Backend

The Terraform state file can be encrypted to protect sensitive data. This can be done by using a secure remote backend, such as Terraform Cloud or S3.

To encrypt the Terraform state file, you would first configure a secure remote backend for the state file. Then, you would encrypt the state file using the `terraform encrypt` command.

## 4. Environment Variables

Sensitive data can also be stored in environment variables. Terraform can read environment variables when it is run.

To use environment variables, you would first define the environment variables in your operating system. Then, you would configure Terraform to read the environment variables when it is run. 

**For example**, to define an environment variable called AWS_ACCESS_KEY_ID, you would use the following command:

`export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID`

Then, you would configure Terraform to read the environment variable by adding the following line to your Terraform configuration file:

```hcl
variable "aws_access_key_id" {
  source = "env://AWS_ACCESS_KEY_ID"
}
```