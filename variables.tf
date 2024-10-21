variable "environment" {
  description = "The environment (e.g., prod, dev, staging)"
  type        = string
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
  default     = null
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable "main_region" {
  description = "The main AWS region"
  type        = string
}

variable "application" {
  description = "The name of the application"
  type        = string
  default     = null
}

variable "costcenter" {
  description = "The cost center"
  type        = string
  default     = null
}

variable "department" {
  description = "The department"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "email_address" {
  type        = string
  description = "Email address to send budget notifications to"
}

variable "budgets" {
  description = "List of budget configurations"
  type = list(object({
    budget_amount = number
  }))
  default = []
}