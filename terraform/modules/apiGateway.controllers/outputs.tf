output "get_status_enpoint_lambda_invoke_arn" {
  value = aws_lambda_function.notificationQue_get_status_lambda.invoke_arn
}

output "resend_endpoint_lambda_invoke_arn" {
  value = aws_lambda_function.notificationQue_resend_lambda.invoke_arn
}

output "resend_enpoint_lambda_name" {
  value = aws_lambda_function.notificationQue_resend_lambda.function_name
}

output "get_status_enpoint_lambda_name" {
  value = aws_lambda_function.notificationQue_get_status_lambda.function_name
}