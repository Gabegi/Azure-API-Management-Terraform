resource "azurerm_api_management_product" "product" {
  api_management_name   = azurerm_api_management.apim.name
  resource_group_name   = azurerm_resource_group.rg.name

  product_id            = "myapiexample"
  display_name          = "API Example Product"

  subscription_required = true
  approval_required     = false
  published             = true
}

resource "azurerm_api_management_product_api" "product_api" {
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name
  product_id          = azurerm_api_management_product.product.product_id
  api_name            = azurerm_api_management_api.api1.name
}