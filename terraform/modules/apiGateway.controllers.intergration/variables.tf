variable "apiGateway_source_execution_arn" {
  type = string
}

variable "get_status_enpoint_lambda_name" {
  type = string
  default = "notificationQue_get_status_lambda"
}

variable "resend_enpoint_lambda_name" {
  type = string
  default = "notificationQue_resend_lambda"
}