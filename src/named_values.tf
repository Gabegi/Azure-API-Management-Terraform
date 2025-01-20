resource "azurerm_api_management_named_value" "nv-api-key" {
  name                = "api-key"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "secret-api-key"
  value               = var.api-key
}