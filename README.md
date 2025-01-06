# Infrastructure as Code(IaC) | Terraform 

Infrastructure as Code (IaC) is a key DevOps practice where infrastructure is provisioned and managed using code and automation tools rather than through manual processes. This approach allows you to define, provision, and manage infrastructure resources like servers, databases, networks, and other components in a declarative way, often using configuration files or scripts. IaC makes infrastructure more consistent, repeatable, and scalable.

Before the advent of IaC, infrastructure management was typically a manual and time-consuming process. System administrators and operations teams had to:

1. Manually Configure Servers: Servers and other infrastructure components were often set up and configured manually, which could lead to inconsistencies and errors.

2. Lack of Version Control: Infrastructure configurations were not typically version-controlled, making it difficult to track changes or revert to previous states.

3. Heavy Documentation: Organizations relied heavily on documentation to record the steps and configurations required for different infrastructure setups. This documentation could become outdated quickly.

4. Limited Automation: Automation was limited to basic scripting, often lacking the robustness and flexibility offered by modern IaC tools.

5. Slow Provisioning: Provisioning new resources or environments was a time-consuming process that involved multiple manual steps, leading to delays in project delivery.

IaC addresses these challenges by providing a systematic, automated, and code-driven approach to infrastructure management. Popular IaC tools include Terraform, AWS CloudFormation, Azure Resource Manager templates others.

These tools enable organizations to define, deploy, and manage their infrastructure efficiently and consistently, making it easier to adapt to the dynamic needs of modern applications and services.

## Popular IaC Tools:

- **Terraform:** A widely-used declarative tool for managing infrastructure across multiple cloud 
providers.
    - Developed by HashiCorp that enables users to define and provision cloud infrastructure using configuration files. 
    - It is declarative, meaning you describe the desired state of your infrastructure, and Terraform takes care of making the necessary changes to achieve that state.

- **AWS CloudFormation:** AWS's native IaC service that lets you define and provision AWS 
infrastructure.

- **Ansible:** Ansible is an imperative IaC tool used for configuration management and application 
deployment.

- **Chef:** Used for both configuration management and infrastructure provisioning, often with a 
more extensive focus on system configuration.

- **Puppet:** Similar to Chef, it's a configuration management tool for automating infrastructure provisioning and management.

## Why Terraform ?

There are multiple reasons why Terraform is used over the other IaC tools but below are the main reasons.

1. **Multi-Cloud Support**: Terraform is known for its multi-cloud support. It allows you to define infrastructure in a cloud-agnostic way, meaning you can use the same configuration code to provision resources on various cloud providers (AWS, Azure, Google Cloud, etc.) and even on-premises infrastructure. This flexibility can be beneficial if your organization uses multiple cloud providers or plans to migrate between them. This allows you to manage resources across different cloud environments in a unified way.

2. **Large Ecosystem**: Terraform has a vast ecosystem of providers and modules contributed by both HashiCorp (the company behind Terraform) and the community. This means you can find pre-built modules and configurations for a wide range of services and infrastructure components, saving you time and effort in writing custom configurations.

3. **Declarative Syntax**: Terraform uses a declarative syntax (HCL - HashiCorp Configuration Language), allowing you to specify the desired end-state of your infrastructure resources like servers, storage, networking, and more. This makes it easier to understand and maintain your code compared to imperative scripting languages.
    - **HCL Language**: is designed specifically for defining infrastructure. It's human-readable and expressive, making it easier for both developers and operators to work with.

4. **Modular Infrastructure:** In Terraform, modules are a way to organize and reuse configurations. A module is a container for multiple resources that are used together. You can define reusable modules (templates) for infrastructure components (a VPC or EC2 instance), making it easy to create standardized resources. You can use modules from the Terraform Registry (public) or create your own private modules.

5. **State Management**: Terraform maintains a state file that tracks the current state of your infrastructure. This state file helps Terraform understand the differences between the desired and actual states of your infrastructure, enabling it to make informed decisions when you apply changes. Terraform's state file is critical for tracking resources. It can be stored remotely (e.g., in an S3 bucket) for shared access in teams.

6. **Plan and Apply**: Terraform's "plan" and "apply" workflow allows you to preview changes before applying them. This helps prevent unexpected modifications to your infrastructure and provides an opportunity to review and approve changes before they are implemented.
    - ```terraform plan```: Shows a preview of what Terraform will do before it applies any changes.
    - ```terraform apply```: Actually provisions or modifies the infrastructure according to the plan.

7. **Community Support**: Terraform has a large and active user community, which means you can find answers to common questions, troubleshooting tips, and a wealth of documentation and tutorials online.

8. **Integration with Other Tools**: Terraform can be integrated with other DevOps and automation tools, such as Docker, Kubernetes, Ansible, and Jenkins, allowing you to create comprehensive automation pipelines.

9. **Resource Graph:** Terraform automatically builds a dependency graph of resources and executes changes in the correct order.

10. **Immutable Infrastructure:** Terraform typically promotes an immutable infrastructure paradigm, where instead of modifying existing resources, the resources are replaced by new ones as needed.

11. **Workspaces:** Manage different environments (like dev, staging, production) using workspaces to isolate state files.

## Terraform Key Terms

To get started with Terraform, it's important to understand some key terminology and concepts. Here are some fundamental terms and explanations.

1. **Provider**: A provider is a plugin for Terraform that defines and manages resources for a specific cloud or infrastructure platform. 
Examples of providers include AWS, Azure, Google Cloud, and many others. 
You configure providers in your Terraform code to interact with the desired infrastructure platform.

2. **Resource**: A resource is a specific infrastructure component that you want to create and manage using Terraform. Resources can include virtual machines, databases, storage buckets, network components, and more. Each resource has a type and configuration parameters that you define in your Terraform code.

3. **Module**: A module is a reusable and encapsulated unit of Terraform code. Modules allow you to package infrastructure configurations, making it easier to maintain, share, and reuse them across different parts of your infrastructure. Modules can be your own creations or come from the Terraform Registry, which hosts community-contributed modules.

4. **Configuration File**: Terraform uses configuration files (often with a `.tf` extension) to define the desired infrastructure state. These files specify providers, resources, variables, and other settings. The primary configuration file is usually named `main.tf`, but you can use multiple configuration files as well.

5. **Variable**: Variables in Terraform are placeholders for values that can be passed into your configurations. They make your code more flexible and reusable by allowing you to define values outside of your code and pass them in when you apply the Terraform configuration.

6. **Output**: Outputs are values generated by Terraform after the infrastructure has been created or updated. Outputs are typically used to display information or provide values to other parts of your infrastructure stack.

7. **State File**: Terraform maintains a state file (often named `terraform.tfstate`) that keeps track of the current state of your infrastructure. This file is crucial for Terraform to understand what resources have been created and what changes need to be made during updates.

8. **Plan**: A Terraform plan is a preview of changes that Terraform will make to your infrastructure. When you run `terraform plan`, Terraform analyzes your configuration and current state, then generates a plan detailing what actions it will take during the `apply` step.

9. **Apply**: The `terraform apply` command is used to execute the changes specified in the plan. It creates, updates, or destroys resources based on the Terraform configuration.

10. **Workspace**: Workspaces in Terraform are a way to manage multiple environments (e.g., development, staging, production) with separate configurations and state files. Workspaces help keep infrastructure configurations isolated and organized.

11. **Remote Backend**: A remote backend is a storage location for your Terraform state files that is not stored locally. Popular choices for remote backends include Amazon S3, Azure Blob Storage, or HashiCorp Terraform Cloud. Remote backends enhance collaboration and provide better security and reliability for your state files.

These are some of the essential terms you'll encounter when working with Terraform. As you start using Terraform for your infrastructure provisioning and management, you'll become more familiar with these concepts and how they fit together in your IaC workflows.

## Problems with Terraform?

- State file is single source of truth.
- Manual changes to the cloud provider cannot be identified and auto-corrected.
- Not a GitOps friendly tool. Don't play well with Flux or ArgoCD.
- Can become very complex and difficult to manage.
- Trying to position as a configuration management tool as well.

## Does terraform follows the concept of Api as code? 

- "API as Code" usually refers to defining and managing APIs using code, such as creating endpoints, handling requests, or configuring API behaviors. This might involve defining API routes, methods, and data handling, often in a backend service framework.

- Terraform itself isn't "API as Code," it uses APIs extensively to interact with APIs (cloud services, databases, etc.). You define infrastructure in Terraform, and it translates those definitions into API calls to provision resources.

- The closest Terraform comes to "API as Code" is the way you define the desired state of your infrastructure in code and then Terraform translates that into API calls to manage the infrastructure.

