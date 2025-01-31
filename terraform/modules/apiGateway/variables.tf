variable "stage_name" {
    default = "dev"
    type = string
}

variable "resend_endpoint_lambda_invoke_arn" {
  type = string
}

variable "get_status_enpoint_lambda_invoke_arn" {
  type = string
}