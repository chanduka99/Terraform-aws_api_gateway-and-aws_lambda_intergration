# get status
    # configure-get-status resource
    resource "aws_api_gateway_resource" "get_status" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
    path_part   = var.get_status_enpoint_path_name
    }

    #configure-get-status method
    resource "aws_api_gateway_method" "get_status_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = "GET"
    authorization = "NONE"
    }

    # configure-get-status intergration request
    resource "aws_api_gateway_integration" "get_status_lambda_integration" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = aws_api_gateway_method.get_status_proxy.http_method
    integration_http_method = "POST"
    passthrough_behavior = "WHEN_NO_TEMPLATES"
    type = "AWS"
    uri = var.get_status_enpoint_lambda_invoke_arn
    }

    # configure-get_status method response
    resource "aws_api_gateway_method_response" "get_status_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = aws_api_gateway_method.get_status_proxy.http_method
    status_code = "200"

    # cors section
    response_parameters = {
      "method.response.header.Access-Control-Allow-Headers" = true,
      "method.response.header.Access-Control-Allow-Methods" = true,
      "method.response.header.Access-Control-Allow-Origin" = true
    }
    }

    # configure-get_status intergration response
    resource "aws_api_gateway_integration_response" "get_status_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = aws_api_gateway_method.get_status_proxy.http_method
    status_code = aws_api_gateway_method_response.get_status_proxy.status_code

  //cors
    response_parameters = {
      "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
      "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
      "method.response.header.Access-Control-Allow-Origin" = "'*'"
      }

    depends_on = [
        aws_api_gateway_method.get_status_proxy,
        aws_api_gateway_integration.get_status_lambda_integration
    ]
    }
