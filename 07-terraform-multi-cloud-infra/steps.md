# Dynamic Multi-Cloud Resource Management using Terraform"

### Step 1: Initialize Terraform**

```bash
terraform init
```

### Step 2: Plan Deployment

```bash
terraform plan -var-file="terraform.tfvars"
```

### Step 3: Apply Changes

```bash
terraform apply -var-file="terraform.tfvars" -auto-approve
```

### Step 4: Check Outputs

```bash
# View the public IPs and other defined outputs.
terraform output
```

### Step 5: Validation

Verify resources in the AWS and Azure consoles:

- AWS → EC2 Dashboard (us-east-1 & us-west-2)

- Azure → Resource Groups → Virtual Machines

- AWS → S3 Console → Buckets

### Step 6: Clean Up

When done, destroy all resources to avoid incurring costs:

```bash
terraform destroy -var-file="terraform.tfvars" -auto-approve
```

