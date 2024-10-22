resource "aws_identitystore_user" "this" {
  identity_store_id = local.identity_store_id

  display_name = "${var.given_name} ${var.family_name}"
  user_name    = lower("${var.given_name}.${var.family_name}")

  name {
    given_name  = var.given_name
    family_name = var.family_name
  }

  emails {
    value = var.email_address
  }
}

resource "aws_identitystore_group" "admin_group" {
  identity_store_id = local.identity_store_id
  display_name      = "AdminGroup"
}

resource "aws_identitystore_group_membership" "this" {
  identity_store_id = local.identity_store_id
  group_id          = aws_identitystore_group.admin_group.group_id
  member_id         = aws_identitystore_user.this.user_id
}

resource "aws_ssoadmin_permission_set" "admin_permission_set" {
  instance_arn     = local.sso_instance_arn
  name             = "AdministratorAccessPermissionSet"
  description      = "SSO Permission Set with AdministratorAccess"
  session_duration = "PT${var.sso_session_hours}H"
}

resource "aws_ssoadmin_account_assignment" "admin_assignment" {
  instance_arn       = local.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.admin_permission_set.arn
  principal_type     = "GROUP"
  principal_id       = aws_identitystore_group.admin_group.group_id
  target_id          = data.aws_caller_identity.current.account_id
  target_type        = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_managed_policy_attachment" "example" {
  instance_arn       = local.sso_instance_arn
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.admin_permission_set.arn

  # Adding an explicit dependency on the account assignment resource will
  # allow the managed attachment to be safely destroyed prior to the removal
  # of the account assignment.
  depends_on = [aws_ssoadmin_account_assignment.admin_assignment]
}
