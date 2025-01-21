resource "azurerm_api_management_api_policy" "policy" {
  api_name            = data.azurerm_api_management_api.api1.name
  api_management_name = azurerm_api_management.apim.name
  resource_group_name = azurerm_resource_group.rg.name

  xml_content = <<XML
<policies>
  <inbound>
    <find-and-replace from="xyz" to="abc" />
  </inbound>
</policies>
XML
}