terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "awsApiGateway" {
  source     = "./modules/apiGateway"
  stage_name = "dev"
}

module "apiGatewayControllers" {
  source = "./modules/apiGateway.controllers"
  # stage_name = "dev"
}