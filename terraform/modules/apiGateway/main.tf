resource "aws_api_gateway_rest_api" "NotificatioQue" {
  name        = "Notificatio Que"
  description = "Api gateway for leco notification que"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}


# defining resources,method,intergration,method response,intergration response
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

  #normal priority
    # configure-normal priority resource
    resource "aws_api_gateway_resource" "normal_priority" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
      path_part   = "normal-priority"
    }
#configure-normal priority method
      resource "aws_api_gateway_method" "normal_priority_proxy" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      resource_id = aws_api_gateway_resource.normal_priority.id
      http_method = "POST"
      authorization = "NONE"
      }

      # configure-normal priority intergration request
      resource "aws_api_gateway_integration" "normal_priority_lambda_integration" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      resource_id = aws_api_gateway_resource.normal_priority.id
      http_method = aws_api_gateway_method.normal_priority_proxy.http_method
      integration_http_method = "POST"
      type = "MOCK"
      }

      # configure-normal pirority method response
      resource "aws_api_gateway_method_response" "normal_priority_proxy" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      resource_id = aws_api_gateway_resource.normal_priority.id
      http_method = aws_api_gateway_method.normal_priority_proxy.http_method
      status_code = "200"
      }

      # configure-normal pirority intergration response
      resource "aws_api_gateway_integration_response" "normal_priority_proxy" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      resource_id = aws_api_gateway_resource.normal_priority.id
      http_method = aws_api_gateway_method.normal_priority_proxy.http_method
      status_code = aws_api_gateway_method_response.normal_priority_proxy.status_code

      depends_on = [
          aws_api_gateway_method.normal_priority_proxy,
          aws_api_gateway_integration.normal_priority_lambda_integration
      ]
      }

  # high priority
    # configure-low priority resource
      resource "aws_api_gateway_resource" "high_priority" {
      rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
      parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
      path_part   = "high-priority"
      }

    #configure-high priority method
    resource "aws_api_gateway_method" "high_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.high_priority.id
    http_method = "POST"
    authorization = "NONE"
    }

    # configure-high priority intergration request
    resource "aws_api_gateway_integration" "high_priority_lambda_integration" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.high_priority.id
    http_method = aws_api_gateway_method.high_priority_proxy.http_method
    integration_http_method = "POST"
    type = "MOCK"
    }

    # configure-high pirority method response
    resource "aws_api_gateway_method_response" "high_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.high_priority.id
    http_method = aws_api_gateway_method.high_priority_proxy.http_method
    status_code = "200"
    }

    # configure-high pirority intergration response
    resource "aws_api_gateway_integration_response" "high_priority_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.high_priority.id
    http_method = aws_api_gateway_method.high_priority_proxy.http_method
    status_code = aws_api_gateway_method_response.high_priority_proxy.status_code

    depends_on = [
        aws_api_gateway_method.high_priority_proxy,
        aws_api_gateway_integration.high_priority_lambda_integration
    ]
    }
# get status
    # configure-get-status resource
    resource "aws_api_gateway_resource" "get_status" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    parent_id   = aws_api_gateway_rest_api.NotificatioQue.root_resource_id
    path_part   = "get-status"
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
    integration_http_method = "GET"
    type = "AWS"
    uri = var.get_status_enpoint_lambda_invoke_arn
    }

    # configure-get_status method response
    resource "aws_api_gateway_method_response" "get_status_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = aws_api_gateway_method.get_status_proxy.http_method
    status_code = "200"
    }

    # configure-get_status intergration response
    resource "aws_api_gateway_integration_response" "get_status_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.get_status.id
    http_method = aws_api_gateway_method.get_status_proxy.http_method
    status_code = aws_api_gateway_method_response.get_status_proxy.status_code

    depends_on = [
        aws_api_gateway_method.get_status_proxy,
        aws_api_gateway_integration.get_status_lambda_integration
    ]
    }

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
    integration_http_method = "GET"
    type = "AWS"
    uri = var.resend_endpoint_lambda_invoke_arn
    }

    # configure-resend method response
    resource "aws_api_gateway_method_response" "resend_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = aws_api_gateway_method.resend_proxy.http_method
    status_code = "200"
    }

    # configure-resend intergration response
    resource "aws_api_gateway_integration_response" "resend_proxy" {
    rest_api_id = aws_api_gateway_rest_api.NotificatioQue.id
    resource_id = aws_api_gateway_resource.resend.id
    http_method = aws_api_gateway_method.resend_proxy.http_method
    status_code = aws_api_gateway_method_response.resend_proxy.status_code

    depends_on = [
        aws_api_gateway_method.resend_proxy,
        aws_api_gateway_integration.resend_lambda_integration
    ]
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