output "get_status_enpoint_lambda_invoke_arn" {
  value = aws_lambda_function.notificationQue_get_status_lambda.invoke_arn
}

output "resend_endpoint_lambda_invoke_arn" {
  value = aws_lambda_function.notificationQue_resend_lambda.invoke_arn
}