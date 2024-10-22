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

module "sso_checker" {
  source = "./modules/sso-checker"
}

module "sso_main_user" {
  source = "./modules/sso_main_user"

  prefix        = local.prefix
  email_address = var.email_address
  family_name   = var.family_name
  given_name    = var.given_name

  depends_on = [module.sso_checker]
}
