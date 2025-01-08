# Drift Detection: 

Terraform relies on its state file to manage infrastructure. The mismatch between the actual infrastructure and Terraform’s state file is called drift. Drift occurs when someone manually modifies infrastructure outside of Terraform’s control. For example:

- A colleague updates an S3 bucket's lifecycle rule manually in AWS.

- Terraform is unaware of this change until you explicitly refresh its state file or detect it via other means.

## Solution 1: Terraform Refresh Command

- Run the following command to sync the Terraform state file with the real infrastructure.
    `terraform refresh`

- Set up a cron job to periodically run `terraform refresh` and notify the team if changes are detected.
    `0 * * * * /usr/local/bin/terraform -chdir=/path/to/terraform/project refresh`

- Compare the state after each terraform refresh by running: `terraform plan`.

- While effective, `terraform refresh` is being deprecated in favor of new methods in Terraform.

## Solution 2: Automated Drift Detection Using Audit Logs

To detect manual changes more proactively, you can leverage AWS audit logs and Lambda functions.

### 1. Enable AWS CloudTrail Logs to record all API calls made in AWS:

- Go to the AWS Management Console → CloudTrail.
- Create a new trail or use an existing one.
- Ensure that Event History is enabled for all management and data events.

Example of an event logged in CloudTrail:

```json
{
  "eventName": "PutBucketLifecycleConfiguration",
  "userIdentity": {
    "userName": "john_doe"
  },
  "requestParameters": {
    "bucketName": "my-terraform-bucket"
  }
}
```

### 2. Deploy the Lambda Function

**The Lambda function**

- Compares the resource modified with a list of Terraform-managed resources.

- Checks if the change was made by Terraform or manually.

- Sends alerts for unauthorized changes.

**Create a new Lambda function:**

- Runtime: Python `3.9+`

- Package the file into a ZIP:

    `zip drift-detection.zip drift-detection.py`

- Go to AWS Lambda Console → Create Function → Upload drift-detection.zip.

**Add necessary IAM permissions:**

- CloudTrail read access.

- SNS publish access.

### 3. Alert Notifications:

- Set Up an SNS Topic

- Create an SNS Topic (DriftAlerts) in the AWS Management Console.

- Subscribe your email or Slack webhook to the SNS topic.

### 4. Test the System

- Modify a Terraform-managed resource manually (e.g., update an S3 bucket lifecycle rule in the AWS Console).

- Check if the Lambda function processes the event and sends an alert via SNS.

### Example Workflow

- A team member manually updates an S3 bucket lifecycle rule in AWS.

- AWS CloudTrail logs this API activity.

- The Lambda function processes the log and detects that the change was made by an IAM user, not Terraform.

- A notification is sent to the team, identifying the resource, the change, and the user who made it.

## Challenges:

- Terraform refresh is subject to potential deprecation and may change in future versions.

- Ensuring audit logs capture all relevant changes and correctly identify manual modifications.

- Setting up CloudTrail and Lambda requires a detailed understanding of AWS logging and permissions.

- Ensuring the system doesn’t flag legitimate changes made by Terraform as manual changes.

- Balancing team permissions to minimize unauthorized manual changes.

- Enforce policies that prevent manual changes to Terraform-managed resources. This can be difficult in large teams.

