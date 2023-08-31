# Main entrypoint
terraform {
  backend "s3" {
    bucket         = "eksatscale-terraform-state-backend-dev"
    key            = "dev/gadgets/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "eksatscale-terraform-state"
  }
  required_version = ">=1.1.0"
}

# Retrieving account_id
data "aws_caller_identity" "current" {}

# Local variables
locals {

  ## EKS Cluster specific variables
  account_id                        = data.aws_caller_identity.current.account_id
  region                            = "ap-southeast-2"
  cluster_name                      = "GadgetsOnline-Cluster"
  vpc_id			    = "vpc-0b1e57f2813bffa18"
  public_subnets                     = ["subnet-016eb3d50ee7053a0", "subnet-0dc028cc59d5c1ac9", "subnet-06218c5a88f3b2298"]
  private_subnets                    = ["subnet-095d3b3fce2ae47eb", "subnet-0d636a2a6a859703a", "subnet-00e54555f38348e9a"]
  db_subnet                        = ["subnet-073bde0b3fb537fbb", "subnet-0ebd482942e4828a1", "subnet-0a25efc81255df5e6"]
  project_name                      = "gadgets"
 }

# Providers
provider "aws" {
  region = local.region
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


# GadgetOnline EKS terraform module
module "gadget_eks" {

  source                      = "../modules/gadget_eks"
  cluster_name                = local.cluster_name
  cluster_enabled_log_types   = ["audit", "api", "authenticator"]
  create_cloudwatch_log_group = true
  cluster_version             = "1.26"
  account_id                  = local.account_id
  region                      = local.region
  project_name                = local.project_name

  vpc_id                     = local.vpc_id
  private_subnet_ids         = local.private_subnets


}

# Outputs
output "account_id" {
  value = local.account_id
}

output "region" {
  value = local.region
}


