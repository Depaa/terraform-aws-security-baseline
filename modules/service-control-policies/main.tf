resource "aws_organizations_policy" "this" {
  for_each = fileset(path.root, "policies/*.json")
  name     = "${var.prefix}-${trimprefix(trimsuffix(each.value, ".json"), "policies/")}"
  content  = file(each.value)

  tags_all = merge(local.tags, {
    "Usage"      = "management",
    "Compliance" = "yes"
  })
}

resource "aws_organizations_policy_attachment" "this" {
  for_each  = aws_organizations_policy.this
  policy_id = each.value.id
  target_id = data.aws_caller_identity.current.account_id
}
