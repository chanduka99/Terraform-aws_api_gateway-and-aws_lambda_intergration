# zipped dummmy code for the lambda functions
data "archive_file" "lambda_package" {
  type = "zip"
  source_file = "${path.module}/../../../lambdaDummyCode/index.mjs"
  output_path = "${path.module}/../../../lambdaDummyCode/index.zip"
}


# lambda for the get-status endpoint
resource "aws_lambda_function" "notificationQue_get_status_lambda" {
  filename      = data.archive_file.lambda_package.output_path
  function_name = var.get_status_enpoint_lambda_name
  role          = aws_iam_role.iam_for_notificationQue_lambdas.arn
  handler       = var.get_status_enpoint_lambda_handler
  runtime       = "nodejs22.x"
}

# lambda for the resend endpoint
resource "aws_lambda_function" "notificationQue_resend_lambda" {
  filename      = data.archive_file.lambda_package.output_path
  function_name = var.resend_enpoint_lambda_name
  role          = aws_iam_role.iam_for_notificationQue_lambdas.arn
  handler       = var.resend_enpoint_lambda_handler
  runtime       = "nodejs22.x"
}
