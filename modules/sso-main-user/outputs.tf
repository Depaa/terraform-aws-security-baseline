output "identity_store_id" {
  value       = local.identity_store_id
  description = "The ID of the Identity Store"
}

output "instance_arn" {
  value       = local.sso_instance_arn
  description = "The ARN of the SSO instance"
}

output "admin_group_id" {
  value       = aws_identitystore_group.admin_group.group_id
  description = "The ID of the admin group"
}

output "admin_permission_set_arn" {
  value       = aws_ssoadmin_permission_set.admin_permission_set.arn
  description = "The ARN of the admin permission set"
}

### Parameter Store

resource "aws_ssm_parameter" "identity_store_id" {
  name  = "/management/identity_store/id"
  type  = "String"
  value = local.identity_store_id

  tags_all = merge(local.tags, {
    "Compliance" = "yes"
    "Usage"      = "management"
  })
}

resource "aws_ssm_parameter" "instance_arn" {
  name  = "/management/instance/arn"
  type  = "String"
  value = local.sso_instance_arn

  tags_all = merge(local.tags, {
    "Compliance" = "yes"
    "Usage"      = "management"
  })
}

resource "aws_ssm_parameter" "admin_group_id" {
  name  = "/management/group/admin/id"
  type  = "String"
  value = aws_identitystore_group.admin_group.group_id

  tags_all = merge(local.tags, {
    "Compliance" = "yes"
    "Usage"      = "management"
  })
}

resource "aws_ssm_parameter" "admin_permission_set_arn" {
  name  = "/management/permission_set/admin/arn"
  type  = "String"
  value = aws_ssoadmin_permission_set.admin_permission_set.arn

  tags_all = merge(local.tags, {
    "Compliance" = "yes"
    "Usage"      = "management"
  })
}
