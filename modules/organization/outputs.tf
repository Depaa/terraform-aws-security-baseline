output "organization_id" {
  value       = aws_organizations_organization.this.id
  description = "The ID of the AWS Organization"
}

output "organization_arn" {
  value       = aws_organizations_organization.this.arn
  description = "The ARN of the AWS Organization"
}

output "organization_root_id" {
  value       = aws_organizations_organization.this.roots[0].id
  description = "The ID of the root of the AWS Organization"
}

output "organization_root_arn" {
  value       = aws_organizations_organization.this.roots[0].arn
  description = "The ARN of the root of the AWS Organization"
}

### Parameter Store

resource "aws_ssm_parameter" "organization_id" {
  name  = "/management/organization/id"
  type  = "String"
  value = aws_organizations_organization.this.id
}

resource "aws_ssm_parameter" "organization_arn" {
  name  = "/management/organization/arn"
  type  = "String"
  value = aws_organizations_organization.this.arn
}

resource "aws_ssm_parameter" "organization_root_id" {
  name  = "/management/organization/root/id"
  type  = "String"
  value = aws_organizations_organization.this.roots[0].id
}

resource "aws_ssm_parameter" "organization_root_arn" {
  name  = "/management/organization/root/arn"
  type  = "String"
  value = aws_organizations_organization.this.roots[0].arn
}