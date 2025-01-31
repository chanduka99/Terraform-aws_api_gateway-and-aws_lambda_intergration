terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region     = "ap-southeast-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

module "apiGatewayControllers" {
  source = "./modules/apiGateway.controllers"
  # variables
  # stage_name = "dev"
  resend_enpoint_lambda_name    = "notificationQue_resend_lambda"
  resend_enpoint_lambda_handler = "index.handler"

  get_status_enpoint_lambda_name    = "notificationQue_get_status_lambda"
  get_status_enpoint_lambda_handler = "index.handler"
}

module "apiGateway" {
  source     = "./modules/apiGateway"
  depends_on = [module.apiGatewayControllers]
  #variables
  stage_name                           = "dev"
  get_status_enpoint_lambda_invoke_arn = module.apiGatewayControllers.get_status_enpoint_lambda_invoke_arn
  resend_endpoint_lambda_invoke_arn    = module.apiGatewayControllers.resend_endpoint_lambda_invoke_arn
}

module "apiGatewayAndControllersIntergration" {
  source     = "./modules/apiGateway.controllers.intergration"
  depends_on = [module.apiGateway, module.apiGatewayControllers]
  # variables
  apiGateway_source_execution_arn = "${module.apiGateway.apiGateway_source_execution_arn}/*/*/*"
  get_status_enpoint_lambda_name  = module.apiGatewayControllers.get_status_enpoint_lambda_name
  resend_enpoint_lambda_name      = module.apiGatewayControllers.resend_enpoint_lambda_name
}