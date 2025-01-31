# resend
    # configure-resend resource
    resource "aws_api_gateway_resource" "resend" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
    path_part   = "resend"
    }

    #configure-resend method
    resource "aws_api_gateway_method" "resend_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = "POST"
    authorization = "NONE"
    }

    # configure-resend intergration request
    resource "aws_api_gateway_integration" "resend_lambda_integration" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = aws_api_gateway_method.resend_proxy.http_method
    integration_http_method = "POST"
    passthrough_behavior = "WHEN_NO_TEMPLATES"
    type = "AWS"
    uri = var.resend_endpoint_lambda_invoke_arn
    }

    # configure-resend method response
    resource "aws_api_gateway_method_response" "resend_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = aws_api_gateway_method.resend_proxy.http_method
    status_code = "200"
    //cors section
    response_parameters = {
      "method.response.header.Access-Control-Allow-Headers" = true,
      "method.response.header.Access-Control-Allow-Methods" = true,
      "method.response.header.Access-Control-Allow-Origin" = true
    }
    }

    # configure-resend intergration response
    resource "aws_api_gateway_integration_response" "resend_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = aws_api_gateway_method.resend_proxy.http_method
    status_code = aws_api_gateway_method_response.resend_proxy.status_code

//cors
    response_parameters = {
      "method.response.header.Access-Control-Allow-Headers" =  "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
      "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST,PUT'",
      "method.response.header.Access-Control-Allow-Origin" = "'*'"
      }
    depends_on = [
        aws_api_gateway_method.resend_proxy,
        aws_api_gateway_integration.resend_lambda_integration
    ]
    }
