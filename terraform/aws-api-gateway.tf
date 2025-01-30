resource "aws_api_gateway_rest_api" "Test" {
  name        = "TestAPI"
  description = "This is my API for demonstration purposes"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "Root" {
  rest_api_id = aws_api_gateway_rest_api.Test.id
  parent_id   = aws_api_gateway_rest_api.Test.root_resource_id
  path_part   = "normal-priority"
}