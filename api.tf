# # api from online spec
# resource "azurerm_api_management_api" "api1" {
#   name                = "api1"
#   resource_group_name = azurerm_resource_group.rg.name
#   api_management_name = azurerm_api_management.apim.name
#   revision            = "1"
#   display_name        = "API1"
#   path                = "api"
#   protocols           = ["https"]
#   import {
#     content_format = "swagger-link-json"
#     content_value  = file(var.test-api-json)
#   }
# }

resource "azurerm_api_management_api" "api1" {
  name                = "example-api1"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = file("./apis/api1.yaml")
  }
}

# api from file
