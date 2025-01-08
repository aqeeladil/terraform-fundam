import boto3

def lambda_handler(event, context):
    # List of Terraform-managed resources
    terraform_resources = ["my-terraform-bucket"]

    # Parse CloudTrail event
    try:
        event_name = event['detail']['eventName']
        bucket_name = event['detail']['requestParameters']['bucketName']
        user_identity = event['detail']['userIdentity']['userName']

        # Check if the resource is Terraform-managed
        if bucket_name in terraform_resources:
            if user_identity != "terraform-role":
                alert_message = f"Drift detected! Resource {bucket_name} was modified by {user_identity}."
                print(alert_message)

                # Send notification
                sns = boto3.client('sns')
                sns.publish(
                    TopicArn='arn:aws:sns:us-east-1:123456789012:DriftAlerts',
                    Message=alert_message,
                    Subject="Terraform Drift Detected"
                )
    except KeyError as e:
        print(f"Error parsing event: {e}")
    return {"statusCode": 200, "body": "Drift detection executed."}
