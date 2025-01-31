resource "aws_api_gateway_rest_api" "NotificatioQue" {
  name        = "Notificatio Que"
  description = "Api gateway for leco notification que"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.low_priority_lambda_integration,
    aws_api_gateway_integration.normal_priority_lambda_integration,
    aws_api_gateway_integration.high_priority_lambda_integration,
    aws_api_gateway_integration.get_status_lambda_integration,
    aws_api_gateway_integration.resend_lambda_integration,
  ]

  rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id

}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.NotificatioQue.id
  stage_name    = var.stage_name
}