# ---------------------------------------------------------------------------------------------------------------------
# CREDENTIALS
# TODO: Move these environment variables
# ---------------------------------------------------------------------------------------------------------------------

variable "access_key" {
  type        = string
  default     = "AKIAXBMRCO23IPEJ2K7J"
}

variable "secret_key" {
  type        = string
  default     = "L4QoY4IMc3zXehiBzeYldL3lMDUivLXx11tYmBfx"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "http_server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}
