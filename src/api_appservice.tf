
// API from app service
resource "azurerm_api_management_api" "api2" {
  name                = "api2-webapp"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]

  // versioning
  version_set_id      = azurerm_api_management_api_version_set.example_version_set.id
  version             = "v1"

  import {
    content_format = "openapi-link"
    content_value  = "https://<app-service-name>.azurewebsites.net/swagger/v1/swagger.json"
  }
}
