# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR AZURE CLOUD PLATFORM CONNECTION
# ------------------------------------------------------------------------------

provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    features {}

    # -------------  
    # The service account is not working. 
    # Login using az cli until then.

    # This information is picked up from credentials.tf 
    # which is not checked into source control for security reasons
    #subscription_id = var.subscription_id
    #tenant_id = var.tenant_id
    #client_id = var.client_id
    #client_secret = var.client_secret
    # -------------
}
