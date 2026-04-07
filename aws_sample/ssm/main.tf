# Terraform version 1.11.4
provider "aws" {
  region = "us-west-2"
}

resource "aws_ssm_parameter" "db_username" {
  name        = "/myapp/config/db_username"
  type        = "String"
  value       = "admin"
  description = "The database username for my app"
}

resource "aws_ssm_parameter" "db_password" {
  name        = "/myapp/config/db_password"
  type        = "SecureString"
  value       = "super_secret_password"
  description = "The database password for my app"
}

data "aws_ssm_parameter" "db_username" {
  name = "/myapp/config/db_username"
}

output "db_username_value" {
  value = data.aws_ssm_parameter.db_username.value
  sensitive = true
}

data "aws_ssm_parameter" "db_password" {
  name            = "/myapp/config/db_password"
  with_decryption = true
}

output "db_password_value" {
  value = data.aws_ssm_parameter.db_password.value
  sensitive = true
}