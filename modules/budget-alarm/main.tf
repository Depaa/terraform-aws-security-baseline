resource "aws_budgets_budget" "this" {
  name         = "${var.prefix}-${tostring(var.budget_amount)}-budget"
  budget_type  = "COST"
  time_unit    = "MONTHLY"
  limit_amount = var.budget_amount
  limit_unit   = "USD"

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "FORECASTED"
    threshold           = 80 # Threshold percentage
    threshold_type      = "PERCENTAGE"

    subscriber_email_addresses = [var.email_address]
  }

  notification {
    comparison_operator = "GREATER_THAN"
    notification_type   = "ACTUAL"
    threshold           = 100 # Actual cost exceeds 100% of budget
    threshold_type      = "PERCENTAGE"

    subscriber_email_addresses = [var.email_address]
  }

  tags_all = merge(local.tags, {
    "Usage" = "management"
  })
}
