variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "aws_access_key" {
  description = "Access Key ID da AWS"
  type        = string
}

variable "aws_secret_key" {
  description = "Secret Access Key da AWS"
  type        = string
}

variable "ami_id" {
  description = "ID da AMI"
  type        = string
}

variable "project_name" {
  description = "Name of the project do create resources for"
  type        = string
  default     = "ada-terraform"
}