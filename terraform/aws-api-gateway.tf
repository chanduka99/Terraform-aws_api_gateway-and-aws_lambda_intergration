resource "aws_api_gateway_rest_api" "NotificatioQue" {
  name        = "Notificatio Que"
  description = "Api gateway for leco notification que"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# defining paths
resource "aws_api_gateway_resource" "low_priority" {
  rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
  parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
  path_part   = "low-priority"
}
resource "aws_api_gateway_resource" "normal_priority" {
  rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
  parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
  path_part   = "normal-priority"
}
resource "aws_api_gateway_resource" "high_priority" {
  rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
  parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
  path_part   = "high-priority"
}
