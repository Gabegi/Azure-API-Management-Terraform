resource "azurerm_api_management_api_policy" "example" {
  api_name            = data.azurerm_api_management_api.example.name
  api_management_name = data.azurerm_api_management_api.example.api_management_name
  resource_group_name = data.azurerm_api_management_api.example.resource_group_name

  xml_content = <<XML
<policies>
  <inbound>
    <find-and-replace from="xyz" to="abc" />
  </inbound>
</policies>
XML
}