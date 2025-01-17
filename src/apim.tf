resource "azurerm_api_management" "apim" {
  name                = "apimtesttraining"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Consumption_0"

  identity {
    type = "SystemAssigned"
  }
}