#Variables for AWS account_id and azs

data "aws_caller_identity" "current" {}
data "aws_availability_zones" "available" {}

variable "cluster_name" {
  description = "EKS Cluster Name"
}

variable "cluster_version" {
  description = "EKS Cluster Version"
}

variable "cluster_enabled_log_types" {
  description = "Functional Kubernetes logging for different components"
}

variable "create_cloudwatch_log_group" {
  description = "Cloudwatch logs group for EKS cluster"
}

variable "region" {
  description = "AWS default region"
}

variable "account_id" {
  description = "AWS Account ID"
}

variable "vpc_id" {
  description = "EKS's VPC"
}

variable "private_subnet_ids" {
  description = "Private subnets for EKS cluster and node group"
}

variable "project_name" {
  description = "Project Name"
}

variable "db_password" {
  description = "MongoDB Password"
}

variable "endpoint" {
  description = "MongoDB endpoint"
}

variable "fqdn" {
  description = "domain_name/URL for formio service"
}

variable "formio_secret_access_key" {
  description = "formio_s3_user_access_key"
}

variable "formio_secret_secret_key" {
  description = "formio_s3_user_secret_key"
}

variable "admin_email" {
  description = "email_id of the admin_user"
}

variable "secret_admin_pass" {
  description = "Address of secret manager for admin password"
}

variable "cert-arn" {
  description = "ACM cert ARN"
}

variable "cert-arn-us-east-1" {
  description = "ACM cert ARN us-east-1 for cloudfront if the infra is not created in us-east-1 region"
}

variable "formio_api_server_docker_tag" {
  description = "Docker image tag for API server formio"
}

variable "formio_pdf_server_docker_tag" {
  description = "Docker image tag for PDF server formio"
}

variable "formio_licence_secret_name" {
  description = "secret name for licence key stored in secret manager"
}

variable "enable_cloudfront" {
  description = "Flag to decide if Cloudfront need to be created"
}
