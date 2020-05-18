# ---------------------------------------------------------------------------------------------------------------------
# VARIABLES AND  PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "http_server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}
