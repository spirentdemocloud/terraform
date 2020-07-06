# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR GOOGLE CLOUD PLATFORM CONNECTION
# ------------------------------------------------------------------------------

provider "google" {
  # --------------
  # The credentials file is not checked into source control for security.
  # Follow instructions on https://www.terraform.io/docs/providers/google/guides/getting_started.html
  # to create this file.
  credentials = file("credentials.json")
  # --------------
  
  # Ensure project matches what is specified in the credentials file.
  project     = "velocity-trinity"
  
  region      = "us-central1"
  zone        = "us-central1-c"

}

