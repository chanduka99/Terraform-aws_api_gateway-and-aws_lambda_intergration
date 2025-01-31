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

variable "binary_media_types" {
  type = list(string)
  default = [ "application/json" ]
}