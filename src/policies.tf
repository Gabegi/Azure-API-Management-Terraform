resource "azurerm_api_management_api_policy" "policy" {
  api_name            = azurerm_api_management_api.api1.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name

  xml_content = file("./policies/policy1.xml")
}