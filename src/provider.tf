terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "apim-rg"
  location = "West Europe"
}

data "azurerm_client_config" "current" {}

data "azurerm_user_assigned_identity" "apim_identity" {
  name                = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name
}


