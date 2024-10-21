module "organization" {
  source = "./modules/organization"
}

module "cloudtrail" {
  source = "./modules/cloudtrail"

  prefix     = local.prefix
  depends_on = [module.organization]
}

module "aws_budgets" {
  for_each = { for idx, budget in var.budgets : idx => budget }
  source   = "./modules/budget-alarm"

  prefix        = local.prefix
  budget_amount = each.value.budget_amount
  email_address = var.email_address
}
