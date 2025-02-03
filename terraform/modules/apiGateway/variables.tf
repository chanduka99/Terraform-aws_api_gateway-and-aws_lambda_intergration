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

variable "resend_endpoint_path_name" {
  type = string
}

variable "get_status_enpoint_path_name" {
  type = string
}

variable "low_priority_endpoint_path_name" {
  type = string
}

variable "normal_priority_enpoint_path_name" {
  type = string
}

variable "high_priority_endpoint_path_name" {
  type = string
}

variable "binary_media_types" {
  type = list(string)
  default = [ "application/json" ]
}