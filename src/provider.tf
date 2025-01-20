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



