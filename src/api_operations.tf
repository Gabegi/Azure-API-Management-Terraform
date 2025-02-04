resource "azurerm_api_management_api_operation" "op1" {
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  api_name            = azurerm_api_management_api.api1.name
  operation_id        = "ExampleOperation"
  display_name        = "$a single operation"
  method              = "GET"
  url_template        = "/get/cutepets/"
  description         = "An operation to fetch all cute pets"
}
