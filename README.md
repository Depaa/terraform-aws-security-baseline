# Terraform AWS Security Baseline
*READY TO USE* Terraform baseline for implementing essential AWS security best practices, including Organizations, SSO, MFA, SCPs, Budget Alarms, CloudTrail, and secure S3 configuration. Automate your AWS account security setup with infrastructure as code.

## Link to The Article
### 🔗 [10 Essential AWS Security Steps for Your AWS Account](https://cloudnature.net/blog/10-essential-aws-security-steps-for-your-aws-account?utm_medium=social&utm_source=github.com&utm_campaign=Depaa)

## How to Deploy

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

## Resources
* AWS Organization
* (you need to enable SSO manually)
* AWS Budgets for cost notification
* SSO user with MFA enabled (by default)
* SCPs, you can enable them by your own (👀 see [README.md](https://github.com/Depaa/terraform-aws-security-baseline/blob/main/policies/README.md))

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
