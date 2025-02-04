resource "azurerm_api_management_api_operation" "op1" {
  resource_group_name = var.apim.resource_group_name
  api_management_name = var.apim.name
  api_name            = azurerm_api_management_api.api1_v2.name
  operation_id        = "ExampleOperation"
  display_name        = "$a single operation"
  method              = "GET"
  url_template        = "/get/cutepets/"
  description         = "An operation to fetch all cute pets only"
}
