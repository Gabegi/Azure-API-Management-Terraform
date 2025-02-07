# resource "azurerm_api_management_api_policy" "policy" {
#   api_name            = azurerm_api_management_api.api1.name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = azurerm_resource_group.rg.name

#   xml_content = file("./policies/policy1.xml")
# }


# resource "azurerm_api_management_policy_fragment" "fragment" {
#   api_management_id = azurerm_api_management.apim.id
#   name              = "example-policy-fragment"
#   format            = "xml"
#   value             = file("./policies/fragment.xml")
# }
