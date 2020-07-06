# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  # These are pulled from credentials.tf which isn't checked into source control for security reasons.
  # See https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180 for more information.
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-east-2"
}

