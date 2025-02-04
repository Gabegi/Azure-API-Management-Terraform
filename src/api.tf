# api from file
resource "azurerm_api_management_api" "api1" {
  name                = "example-api1"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "2" //forces replacement
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]

  // versioning
  version_set_id      = azurerm_api_management_api_version_set.example_version_set.id
  version             = "v1"

  import {
    content_format = "openapi"
    content_value  = file("./api_specs/api1.yaml")
  }
}

resource "azurerm_api_management_api" "api1_v2" {
  name                = "example-api1-v2"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"  
  display_name        = "Example API"
  path                = "example"
  protocols           = ["https"]

  # Keep the same version set 
  version_set_id      = azurerm_api_management_api_version_set.example_version_set.id
  version             = "v2" # Incremented version  number

  import {
    content_format = "openapi"
    content_value  = file("./api_specs/api1_v2.yaml")  # Updated API spec for version 2
  }
}


// groups different versions of the same API under a single base path.
resource "azurerm_api_management_api_version_set" "example_version_set" {
  name                = "example-api-version-set"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "Example API Version Set"
  versioning_scheme   = "Segment" # Options: Segment, Header, Query
}
