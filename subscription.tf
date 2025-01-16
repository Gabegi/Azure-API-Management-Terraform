resource "azurerm_api_management_subscription" "sub" {
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_api_management.apim.resource_group_name

  display_name        = "Example API Sub"

  api_id = azurerm_api_management_api.api1.id
}