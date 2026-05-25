variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "project-bedrock"
}
variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}