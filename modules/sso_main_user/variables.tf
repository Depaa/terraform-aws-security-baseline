variable "prefix" {
  description = "The prefix string"
  type        = string
}

variable "given_name" {
  description = "The given name of the user"
  type        = string
}

variable "family_name" {
  description = "The family name of the user"
  type        = string
}

variable "email_address" {
  type        = string
  description = "Email address of the user"
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