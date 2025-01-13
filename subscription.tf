resource "azurerm_api_management_subscription" "sub" {
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_api_management.apim.resource_group_name
  user_id             = data.azurerm_api_management_user.example.id
  product_id          = data.azurerm_api_management_product.example.id
  display_name        = "Parser API"
}