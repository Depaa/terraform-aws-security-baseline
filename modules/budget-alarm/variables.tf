variable "prefix" {
  description = "The prefix string"
  type        = string
}

variable "budget_amount" {
  description = "The amount for the budget threshold."
  type        = number
}

variable "email_address" {
  description = "The email address to send budget alerts."
  type        = string
}
