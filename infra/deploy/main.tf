terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.0"
    }
  }

  backend "s3" {
    bucket               = "devops-recipe-app-tf-dls"
    key                  = "tf-state-deploy"
    workspace_key_prefix = "tf-state-deploy-env"
    region               = "eu-west-3"
    encrypt              = true
    dynamodb_table       = "devops-recipe-app-api-tf-lock"
  }
}

provider "aws" {
  region = "eu-west-3"
  default_tags {
    tags = {
      Environnement = terraform.workspace
      Project       = var.project
      ManageBy      = "Terraform/deploy"
    }
  }
}

locals {
  prefixe = "${var.prefixe}-${terraform.workspace}"
}

data "aws_region" "current" {}
