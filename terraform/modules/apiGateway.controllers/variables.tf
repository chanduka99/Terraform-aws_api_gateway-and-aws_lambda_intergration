variable "get_status_enpoint_lambda_name" {
  type = string
  default = "notificationQue_get_status_lambda"
}

variable "resend_enpoint_lambda_name" {
  type = string
  default = "notificationQue_resend_lambda"
}

variable "get_status_enpoint_lambda_handler" {
  type = string
  default = "index.handler"
}

variable "resend_enpoint_lambda_handler" {
  type = string
  default = "index.handler"
}

