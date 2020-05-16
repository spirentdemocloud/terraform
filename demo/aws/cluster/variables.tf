# ---------------------------------------------------------------------------------------------------------------------
# CREDENTIALS
# TODO: Move these environment variables
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY


# ameya.barve@sprent.com/user1
# Access Key Id: AKIAZL4GSAQ3ZU3GYLNB
# Secret access key: 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

# ameya@barve.net/user1
# Access Key Id: AKIAXBMRCO23IPEJ2K7J
# Secret access key: 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

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

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}

variable "elb_port" {
  description = "The port the ELB will use for HTTP requests"
  type        = number
  default     = 80
}
