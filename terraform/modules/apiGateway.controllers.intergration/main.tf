# resend enpoint lambda
  resource "aws_lambda_permission" "resend_enpoint_lambda_permisson" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = var.resend_enpoint_lambda_name
    principal = "apigateway.amazonaws.com"

    source_arn = var.apiGateway_source_execution_arn
  }
#get-status endpoint lambda 
  resource "aws_lambda_permission" "get_status_enpoint_lambda_permisson" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = var.get_status_enpoint_lambda_name
    principal = "apigateway.amazonaws.com"

    # source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/*/*"
    source_arn = var.apiGateway_source_execution_arn
  }