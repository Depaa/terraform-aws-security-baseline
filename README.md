# terraform-aws-security-baseline
*READY TO USE* Terraform baseline for implementing essential AWS security best practices, including Organizations, SSO, MFA, SCPs, Budget Alarms, CloudTrail, and secure S3 configuration. Automate your AWS account security setup with infrastructure as code.

## How to Deployment

1. Run this step:
```
terraform init
```

or if you have the S3 bucket for the state:
```
terraform init -input=false 
    -backend-config="bucket=[BUCKET_NAME]" 
    -backend-config="key=[KEY_PREFIX].tfstate" 
    -backend-config="region=[REGION]"
```

2. Planning what is going to happen:
```
terraform plan -var-file=terraform.tfvars
```

3. If everything looks good, deploy:
```
terraform apply -var-file=terraform.tfvars
```

## Tagging Strategy
Starting with the right tagging strategy in mind is perfect:

* Environment
* Project
* Application
* CostCenter
* Owner
* Department
* Usage (management, scheduled, event-driven, api, etc)
* Sensitive (yes, no)
* Compliance
* IaCTool