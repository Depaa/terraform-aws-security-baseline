locals {
  prefix = lower(var.owner != null && var.owner != "" ? "${var.environment}-${var.owner}-${var.project}" : "${var.environment}-${var.project}")

  required_tags = {
    Environment = lower(var.environment)
    Project     = lower(var.project)
    Application = var.application != null ? lower(var.application) : null
    CostCenter  = var.costcenter != null ? lower(var.costcenter) : null
    Owner       = var.owner != null ? lower(var.owner) : null
    Department  = var.department != null ? lower(var.department) : null
    IaCTool     = "terraform"
  }

  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}
