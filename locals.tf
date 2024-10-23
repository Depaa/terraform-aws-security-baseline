locals {
  environment = "prod"
  project     = "security-baseline"
  prefix      = lower(var.owner != null && var.owner != "" ? "${local.environment}-${var.owner}-${local.project}" : "${local.environment}-${local.project}")

  required_tags = {
    Environment = "prod"
    Project     = "security-baseline"
    Application = var.application != null ? lower(var.application) : null
    CostCenter  = var.costcenter != null ? lower(var.costcenter) : null
    Owner       = var.owner != null ? lower(var.owner) : null
    Department  = var.department != null ? lower(var.department) : null
    IaCTool     = "terraform"
  }

  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}
