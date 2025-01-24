
# // API from app service
# resource "azurerm_api_management_api" "api2" {
#   name                = "api2-webapp"
#   resource_group_name = azurerm_resource_group.rg.name
#   api_management_name = azurerm_api_management.apim.name
#   revision            = "1"
#   display_name        = "Example API"
#   path                = "example"
#   protocols           = ["https"]

#   // versioning
#   version_set_id      = azurerm_api_management_api_version_set.example_version_set.id
#   version             = "v1"

#   import {
#     content_format = "openapi-link"
#     content_value  = "https://afdafdafda-app-service.azurewebsites.net/swagger/v1/swagger.json"
#   }
# }

# # Create an App Service Plan
# resource "azurerm_app_service_plan" "app_service_plan" {
#   name                = "afdafdafda"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku {
#     tier = "Standard"
#     size = "S1"
#   }
# }

# # Create an App Service
# resource "azurerm_app_service" "app_service" {
#   name                = "afdafdafda-app-service"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

#   site_config {
#     dotnet_framework_version = "v6.0" # Example for an ASP.NET Core app
#   }

#   app_settings = {
#     "WEBSITE_RUN_FROM_PACKAGE" = "1" # Enables deployment using a zip package
#     "ASPNETCORE_ENVIRONMENT"   = "Production"
#   }
# }
