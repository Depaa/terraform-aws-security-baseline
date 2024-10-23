variable "owner" {
  description = "The owner of the resources"
  type        = string
  default     = null
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
  description = "Email address of the user"
}

variable "budgets" {
  description = "List of budget configurations"
  type = list(object({
    budget_amount = number
  }))
  default = []
}

variable "given_name" {
  description = "The given name of the user"
  type        = string
}

variable "family_name" {
  description = "The family name of the user"
  type        = string
}

variable "sso_session_hours" {
  description = "Number of hours for the SSO session duration (between 1 and 24)"
  type        = number
  default     = 8  # Default to 8 hours if not specified
  validation {
    condition     = var.sso_session_hours > 0 && var.sso_session_hours <= 24
    error_message = "The number of session hours must be greater than 0 and no more than 24."
  }
}