resource "aws_api_gateway_rest_api" "NotificatioQue" {
  name        = "Notificatio Que"
  description = "Api gateway for leco notification que"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}


# defining resources,method,intergration,method response,intergration response
    # configure-low priority resource
    resource "aws_api_gateway_resource" "low_priority" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
    path_part   = "low-priority"
    }

    #configure-low priority method
    resource "aws_api_gateway_method" "proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = "POST"
    authorization = "NONE"
    }

    # configure-low priority intergration request
    resource "aws_api_gateway_integration" "lambda_integration" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.proxy.http_method
    integration_http_method = "POST"
    type = "MOCK"
    }

    # configure-low pirority method response
    resource "aws_api_gateway_method_response" "proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.proxy.http_method
    status_code = "200"
    }

    # configure-low pirority intergration response
    resource "aws_api_gateway_integration_response" "proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.proxy.http_method
    status_code = aws_api_gateway_method_response.proxy.status_code

    depends_on = [
        aws_api_gateway_method.proxy,
        aws_api_gateway_integration.lambda_integration
    ]
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


resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.lambda_integration,
  ]

  rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id

}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.NotificatioQue.id
  stage_name    = var.stage_name
}