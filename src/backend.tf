// backend from resource
resource "azurerm_api_management_backend" "backend" {
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  name                = "backend-func"
  protocol            = "http"
  url                 = "https://omg-what-an-app.azurewebsites.net"
  description         = "Backend Application hosting APIs from omg-what-an-app"
  credentials {
    header = {
      x-functions-key = azurerm_api_management_named_value.nv-kv-api-key.value
    }
  }

  depends_on = [ azurerm_windows_function_app.app ]
}


// Function App that serves as backend
resource "azurerm_storage_account" "sa" {
  name                     = "kadmafdsafasfdasdfa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = "omg-what-an-asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "app" {
  name                = "omg-what-an-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  service_plan_id            = azurerm_service_plan.asp.id

  site_config {}
}