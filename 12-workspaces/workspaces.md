# Terraform Workspaces

Terraform workspaces are a feature that allows you to manage multiple environments (e.g., Dev, QA, Stage, Prod) within a single Terraform project. Workspaces solve the issue of state file conflicts by creating separate state files for each environment, ensuring that infrastructure configurations do not overwrite each other.

## Problem Terraform Workspaces Solve

1. **Repetitive Code:** Without workspaces, you might need to duplicate Terraform code for each environment, leading to maintenance challenges.

2. **State File Conflicts:** If you use a single state file for multiple environments, Terraform might overwrite resources in one environment while deploying to another, causing infrastructure conflicts. Separate state files ensure resources are isolated and do not conflict.

3. **Scalability Issues:** Managing multiple environments manually becomes impractical for large-scale infrastructure setups.

## Limitations

1. **Logical Environments Only:** Workspaces are not designed for managing entirely separate projects or organizational boundaries.

2. **State File Complexity:** If state files grow large, managing them for each workspace might require additional strategies.

3. **Shared Resources:** Workspaces do not inherently handle shared resources across environments; these must be managed separately.

## How Workspaces Work

Workspaces segregate the state files for each environment. When you create a new workspace, Terraform generates a separate directory under `.terraform.tfstate.d/` with unique state files for that environment.

When switching between workspaces, Terraform ensures that changes only apply to the state file of the currently selected workspace.

## Key Commands

```bash
# Creating a Workspace: 
terraform workspace new <workspace_name>

# Switching Workspaces: 
terraform workspace select <workspace_name>

# Listing Workspaces: 
terraform workspace list

# Checking the Current Workspace: 
terraform workspace show
```

## Implementation

```bash
# Initialize the project:
terraform init

# Create Workspaces for Environments:
terraform workspace new dev
terraform workspace new stage
terraform workspace new prod

# List workspaces to verify:
terraform workspace list

# Deploy Resources: 
# Switch to the desired workspace and apply configuration: 
terraform workspace select dev
terraform apply -var-file=dev.tfvars

terraform workspace select stage
terraform apply -var-file=stage.tfvars

terraform workspace select prod
terraform apply -var-file=prod.tfvars

# Each workspace gets its own state file stored in .terraform.tfstate.d/<workspace_name>/terraform.tfstate.

# Verify in AWS Console

# Cleanup Resources
terraform workspace select dev
terraform destroy

terraform workspace select stage
terraform destroy

terraform workspace select prod
terraform destroy
```