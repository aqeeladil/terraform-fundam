# Infrastructure as Code (IaC) | Terraform

Infrastructure as Code (IaC) is a key DevOps practice where infrastructure is provisioned and managed using code and automation tools rather than through manual processes. This approach allows you to define, provision, and manage infrastructure resources like servers, databases, networks, and other components in a declarative way, often using configuration files or scripts. IaC makes infrastructure more consistent, repeatable, and scalable.

**Popular IaC Tools:**

- Terraform: A widely-used declarative tool for managing infrastructure across multiple cloud 
providers.
- AWS CloudFormation: AWS's native IaC service that lets you define and provision AWS 
infrastructure.
- Ansible: Ansible is an imperative IaC tool used for configuration management and application 
deployment.
- Chef: Used for both configuration management and infrastructure provisioning, often with a 
more extensive focus on system configuration.
- Puppet: Similar to Chef, it's a configuration management tool for automating infrastructure provisioning and management.

## Terraform

Terraform is a popular Infrastructure as Code (IaC) tool developed by HashiCorp that enables users to define and provision cloud infrastructure using configuration files. Terraform is declarative, meaning you describe the desired state of your infrastructure, and Terraform takes care of making the necessary changes to achieve that state.

### Key Features:

- **Declarative Configuration:** Terraform uses a high-level configuration language (HCL - HashiCorp Configuration Language) to define the desired state of infrastructure resources like servers, storage, networking, and more.
- **Multi-Cloud Support:** Terraform supports multiple cloud providers such as AWS, Google Cloud, Azure, and others, allowing you to manage resources across different cloud environments in a unified way.
- **State Management:** Terraform keeps track of the infrastructure’s current state in a state file, ensuring that changes are applied incrementally rather than making redundant updates. Terraform's state file is critical for tracking resources. It can be stored remotely (e.g., in an S3 bucket) for shared access in teams.
- **Modular Infrastructure:** In Terraform, modules are a way to organize and reuse configurations. A module is a container for multiple resources that are used together. You can define reusable modules (templates) for infrastructure components (a VPC or EC2 instance), making it easy to create standardized resources. You can use modules from the Terraform Registry (public) or create your own private modules.
- **Plan and Apply:** Terraform provides two main commands for deploying infrastructure:
  - ```terraform plan```: Shows a preview of what Terraform will do before it applies any changes.
  - ```terraform apply```: Actually provisions or modifies the infrastructure according to the plan.
- **Resource Graph:** Terraform automatically builds a dependency graph of resources and executes changes in the correct order.
- **Immutable Infrastructure:** Terraform typically promotes an immutable infrastructure paradigm, where instead of modifying existing resources, the resources are replaced by new ones as needed.
- **Workspaces:** Manage different environments (like dev, staging, production) using workspaces to isolate state files.

### Terraform Workflow:

1. **Write:** Define your infrastructure in ```.tf``` files using HCL.
```hcl
# Define the provider (AWS in this case):

provider "aws" {
  region = "us-west-2"
}

# Define an EC2 instance resource:

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the latest AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformInstance"
  }
}
```
2. **Initialize working directory:** 
```bash
terraform init
```
3. **Review the execution plan:**
```bash
terraform plan
```
4. **Apply the changes to your infrastructure:**
```bash
terraform apply
``` 
5. **Manage:** Make future updates to your configuration files, run ```terraform plan``` again, and then ```terraform apply``` to implement the changes.
6. **Delete the resources:**
```bash
terraform destroy
```
7. **View Output:**
```bash
terraform output
```
![Terraform Workflow](https://drive.google.com/file/d/1kpC4IGQLKgHcccW25aJcPK5t09Treoqp/view?usp=sharing).

![Terraform Setup](https://drive.google.com/file/d/1tUiJEq7aQk7cbGdajtm23GhtG_PXBoWc/view?usp=sharing).

### Does terraform follows the concept of Api as code? 

- "API as Code" usually refers to defining and managing APIs using code, such as creating endpoints, handling requests, or configuring API behaviors. This might involve defining API routes, methods, and data handling, often in a backend service framework.
- Terraform itself isn't "API as Code," it uses APIs extensively to interact with APIs (cloud services, databases, etc.). You define infrastructure in Terraform, and it translates those definitions into API calls to provision resources.
- The closest Terraform comes to "API as Code" is the way you define the desired state of your infrastructure in code and then Terraform translates that into API calls to manage the infrastructure.

### What is the problem that Terraform solves?? 

- Terraform addresses the challenges of managing infrastructure by 
- It automates and codify the process by ensuring consistency, reducing errors, and enabling better scalability and collaboration. 

### Problems with Terraform?

- State file is single source of truth.
- Manual changes to the cloud provider cannot be identified and auto-corrected.
- Not a GitOps friendly tool. Don't play well with Flux or ArgoCD.
- Can become very complex and difficult to manage.
- Trying to position as a configuration management tool as well.







