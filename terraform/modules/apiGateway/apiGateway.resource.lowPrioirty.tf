#low priority
    # configure-low priority resource
    resource "aws_api_gateway_resource" "low_priority" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
    path_part   = "low-priority"
    }

    #configure-low priority method
    resource "aws_api_gateway_method" "low_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = "POST"
    authorization = "NONE"
    }

    # configure-low priority intergration request
    resource "aws_api_gateway_integration" "low_priority_lambda_integration" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.low_priority_proxy.http_method
    integration_http_method = "POST"
    passthrough_behavior = "WHEN_NO_TEMPLATES"
    type = "MOCK"
    }

    # configure-low pirority method response
    resource "aws_api_gateway_method_response" "low_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.low_priority_proxy.http_method
    status_code = "200"
    }

    # configure-low pirority intergration response
    resource "aws_api_gateway_integration_response" "low_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.low_priority.id
    http_method = aws_api_gateway_method.low_priority_proxy.http_method
    status_code = aws_api_gateway_method_response.low_priority_proxy.status_code

    depends_on = [
        aws_api_gateway_method.low_priority_proxy,
        aws_api_gateway_integration.low_priority_lambda_integration
    ]
    }