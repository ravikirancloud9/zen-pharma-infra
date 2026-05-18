variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "DEV_DB_PASSWORD" {
  description = "Database password (set in Terraform Cloud workspace variables or as TF_VAR_db_paa)"
  type        = string
}

variable "DEV_JWT_SECRET" {
  description = "JWT secret (set in Terraform Cloud workspace variables or as TF_VAR_jwt)"
  type        = string
}


variable "db_password" {
  description = "Master password for the RDS PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT signing secret for the application"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub username or organization that owns zen-pharma-frontend and zen-pharma-backend (e.g. john-smith)"
  type        = string
  default     = "DPP-2026"
}